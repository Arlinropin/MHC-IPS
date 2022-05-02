//
//  UserService.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante on 30/04/22.
//

public class UserService {
    public let repository: UserRepository
    
    public init(_ repository: UserRepository){
        self.repository = repository
    }
    
    public func saveThis(user: UserApp) throws {
        if try repository.isThereAUserWithThis(document: user.getDocumentType(), user.getDocumentNumber()) {
            throw DomainException.userExist()
        } else {
            try saveUser(user)
        }
    }
    
    private func saveUser(_ user: UserApp) throws {
        let lastUserId = try repository.getLastUserId()
        let newUser = try UserApp(uid: lastUserId + 1,
                              names: user.getNames(),
                              surnames: user.getSurnames(),
                              documentType: user.getDocumentType(),
                              documentNumber: user.getDocumentNumber(),
                              nickname: user.getNickname(),
                              password: user.getPassword(),
                              role: user.getRole())
        
        try repository.saveThis(user: newUser)
    }
    
    public func getAllUsers() throws -> [UserApp] {
        return try repository.getAllUsers()
    }

    public func getUser(nickname: String, password: String) throws -> UserApp{
        do {
            return try repository.getUser(with: nickname, and: password)
        } catch {
            throw DomainException.userNoExist()
        }
    }

    public func deleteUser(user: UserApp) throws{
        return try repository.delete(user)
    }

    public func updateUser(_ user: UserApp) throws{
        return try repository.updateUser(user)
    }
}
