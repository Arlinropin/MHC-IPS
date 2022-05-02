//
//  UserDataBaseRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante on 1/05/22.
//

import Domain
import RealmSwift

public class UserDataBaseRepository: UserRepository {

    private var dataBaseManager = DataBaseManager()
    private var translator = UserEntityTranslator()
    public static let shared = UserDataBaseRepository()

    public func saveThis(user: UserApp) throws {
        let userDataBaseEntity = translator.fromDomainToDataBaseEntity(user)
        try dataBaseManager.saveObject(userDataBaseEntity)
    }

    public func getAllUsers() throws -> [UserApp] {
        let dataBaseEntities = try dataBaseManager.getFetch()
        var domainEntities: [UserApp] = []
        try dataBaseEntities.forEach({entity in
            domainEntities.append(try translator.fromDataBaseToDomainEntity(entity))
        })
        return domainEntities
    }

    public func getUser(with nickname: String, and password: String) throws -> UserApp {
        let dataBaseEntities = try dataBaseManager.getFetch(with: nickname, and: password)
        guard dataBaseEntities.count == 1 else {
            throw InfrastructureException.ErrorFetch()
        }
        let existingDataBaseEntity = dataBaseEntities[0]
        return try translator.fromDataBaseToDomainEntity(existingDataBaseEntity)
    }

    public func delete(_ user: UserApp) throws {
        let userDataBaseEntity = translator.fromDomainToDataBaseEntity(user)
        try dataBaseManager.deleteObject(userDataBaseEntity)
    }

    public func updateUser(_ user: UserApp) throws {
        let userDataBaseEntity = translator.fromDomainToDataBaseEntity(user)
        let oldUserDataBaseEntities = try dataBaseManager.getFetch(with: user.getUid())
        guard oldUserDataBaseEntities.count == 1 else {
            throw InfrastructureException.ErrorUpdating()
        }
        try dataBaseManager.updateObject(oldUserDataBaseEntities[0], forThis: userDataBaseEntity)
    }

    public func isThereAUserWithThis(document documentType: DocumentType,_ documentNumber: String) throws -> Bool {
        let userDataBaseEntities = try dataBaseManager.getFetch(withDocument: documentType.rawValue, andNumber: documentNumber)
        return userDataBaseEntities.count > 0
    }
    
    public func getLastUserId() throws -> Int {
        return try dataBaseManager.getFetchLastId()
    }
}
