//
//  UserDataBaseEntity.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante on 1/05/22.
//

import RealmSwift
import Domain

public class UserDataBaseEntity: Object {
    
    @Persisted var uid: Int
    @Persisted var names: String
    @Persisted var surnames: String
    @Persisted var documentType: String
    @Persisted var documentNumber: String
    @Persisted var creationDate: Date
    @Persisted var nickname: String
    @Persisted var password: String
    @Persisted var role: String
    
    // MARK: - Init
    convenience init(uid: Int,
                names: String,
                surnames: String,
                documentType: DocumentType,
                documentNumber: String,
                creationDate: Date,
                nickname: String,
                password: String,
                role: Role) {
        self.init()
        self.uid = uid
        self.names = names
        self.surnames = surnames
        self.documentType = documentType.rawValue
        self.documentNumber = documentNumber
        self.creationDate = creationDate
        self.nickname = nickname
        self.password = password
        self.role = role.rawValue
    }
}
