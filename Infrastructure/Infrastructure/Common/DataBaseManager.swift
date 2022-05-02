//
//  DataBaseManager.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante on 1/05/22.
//

import RealmSwift
import Domain

public class DataBaseManager {

    public static let shared = DataBaseManager()
    
    func saveObject(_ object: UserDataBaseEntity) throws {
        let database = try Realm()
        try database.write {
            debugPrint(object)
            database.add(object)
            debugPrint("Saved")
        }
    }

    func updateObject(_ object: UserDataBaseEntity, forThis newObject: UserDataBaseEntity) throws {
        let database = try Realm()
        try database.write {
            object.uid = newObject.uid
            object.names = newObject.names
            object.surnames = newObject.surnames
            object.documentType = newObject.documentType
            object.documentNumber = newObject.documentNumber
            object.creationDate = newObject.creationDate
            object.nickname = newObject.nickname
            object.password = newObject.password
            object.role = newObject.role
        }
    }
    
    func getFetch(with uid: Int) throws -> [UserDataBaseEntity] {
        return try getFetch().filter({$0.uid == uid})
    }

    func getFetch(with nickname: String, and password: String) throws -> [UserDataBaseEntity] {
        return try getFetch().filter({$0.nickname == nickname && $0.password == password})
    }
    
    func getFetch(withDocument documentType: String, andNumber documentNumber: String) throws -> [UserDataBaseEntity] {
        return try getFetch().filter({$0.documentType == documentType && $0.documentNumber == documentNumber})
    }

    func getFetchLastId() throws -> Int {
        let database = try Realm()
        let lastObject = database.objects(UserDataBaseEntity.self).map{$0.uid}.max() ?? 0
        return lastObject
    }

    func getFetch() throws -> [UserDataBaseEntity] {
        let database = try Realm()
        let parkingShiftDataBaseEntities: Results<UserDataBaseEntity> = database.objects(UserDataBaseEntity.self)
        debugPrint(parkingShiftDataBaseEntities)
        return Array(parkingShiftDataBaseEntities)
    }
    
    func deleteObject(_ user: UserDataBaseEntity) throws {
        let database = try Realm()
        let users = database.objects(UserDataBaseEntity.self)
        guard let userToDelete = users.first(where: {$0.uid == user.uid}) else {
            throw InfrastructureException.ErrorRemove()
        }
        try database.write {
            database.delete(userToDelete)
        }
    }
}
