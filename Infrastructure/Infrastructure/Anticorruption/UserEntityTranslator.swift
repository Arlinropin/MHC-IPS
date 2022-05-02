//
//  UserEntityTranslator.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante on 1/05/22.
//
import Domain
import RealmSwift

class UserEntityTranslator {

    public func fromDomainToDataBaseEntity(_ domainEntity: UserApp) -> UserDataBaseEntity {
        let user = UserDataBaseEntity(uid: domainEntity.getUid(),
                                      names: domainEntity.getNames(),
                                      surnames: domainEntity.getSurnames(),
                                      documentType: domainEntity.getDocumentType(),
                                      documentNumber: domainEntity.getDocumentNumber(),
                                      creationDate: domainEntity.getCreationDate(),
                                      nickname: domainEntity.getNickname(),
                                      password: domainEntity.getPassword(),
                                      role: domainEntity.getRole())
        return user
    }
    
    public func fromDataBaseToDomainEntity(_ dataBaseEntity: UserDataBaseEntity) throws -> UserApp {
        let documentType = DocumentType.allCases.first(where: {$0.rawValue == dataBaseEntity.documentType})
        let role = Role.allCases.first(where: {$0.rawValue == dataBaseEntity.role})
        let user = try UserApp(uid: dataBaseEntity.uid,
                               names: dataBaseEntity.names,
                               surnames: dataBaseEntity.surnames,
                               documentType: documentType ?? .none,
                               documentNumber: dataBaseEntity.documentNumber,
                               nickname: dataBaseEntity.nickname,
                               password: dataBaseEntity.password,
                               role: role ?? .Client)
        return user
    }
}
