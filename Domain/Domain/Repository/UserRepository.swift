//
//  UserRepository.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante on 30/04/22.
//

public protocol UserRepository {
    func saveThis(user: UserApp) throws
    func getAllUsers() throws -> [UserApp]
    func getUser(with nickname: String, and password: String) throws -> UserApp
    func getLastUserId() throws -> Int
    func delete(_ user: UserApp) throws
    func updateUser(_ user: UserApp) throws
    func isThereAUserWithThis(document documentType: DocumentType,_ documentNumber: String) throws -> Bool
}
