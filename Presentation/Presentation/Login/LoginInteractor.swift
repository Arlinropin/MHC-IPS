//
//  LoginInteractor.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain
import Infrastructure

class LoginInteractor: LoginInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: LoginInteractorOutputProtocol?
    private let service = UserService(UserDataBaseRepository.shared)
    
    func saveAdminforOnce(){
        if (UserDefaults.standard.string(forKey: "Token") == nil) {
            let admin = try! UserApp(uid: 0,
                                     names: "Admin",
                                     surnames: "istrador",
                                     documentType: .CC,
                                     documentNumber: "0",
                                     nickname: "Admin",
                                     password: "Admin12345",
                                     role: .Admin)
            try! UserService(UserDataBaseRepository.shared).saveThis(user: admin)
            UserDefaults.standard.set("Arlin", forKey: "Token")
        }
    }
    
    func login(nickname: String, password: String) throws {
        let user = try service.getUser(nickname: nickname, password: password)
        if user.getRole() == .Admin {
            presenter?.goToUsersList()
        } else {
            presenter?.goToUserData(user: user)
        }
    }
}

