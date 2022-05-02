//
//  RegisterInteractor.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain
import Infrastructure

class RegisterInteractor: RegisterInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: RegisterInteractorOutputProtocol?
    private let service = UserService(UserDataBaseRepository.shared)

    func saveUser(user: UserApp) {
        try! service.saveThis(user: user)
        presenter?.goBack()
    }
}

