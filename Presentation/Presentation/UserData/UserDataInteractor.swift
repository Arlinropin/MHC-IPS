//
//  UserDataInteractor.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain
import Infrastructure

class UserDataInteractor: UserDataInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: UserDataInteractorOutputProtocol?
    private let service = UserService(UserDataBaseRepository.shared)
    
    func getUpdateUser(newUser: UserApp) throws {
        try service.updateUser(newUser)
        presenter?.goBack()
    }
}

