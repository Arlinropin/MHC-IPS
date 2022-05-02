//
//  UsersListInteractor.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain
import Infrastructure

class UsersListInteractor: UsersListInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: UsersListInteractorOutputProtocol?
    private let service = UserService(UserDataBaseRepository.shared)
    
    func getAllUsers() throws {
        let users = try service.getAllUsers()
        let orderedUsers = users.sorted(by: {$0.getSurnames() < $1.getSurnames()})
        presenter?.showUsers(users: orderedUsers)
    }
    
    func deleteUser(_ user: UserApp) throws {
        try service.deleteUser(user: user)
        try getAllUsers()
    }
}

