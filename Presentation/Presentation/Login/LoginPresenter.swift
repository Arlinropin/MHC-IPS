//
//  LoginPresenter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain

class LoginPresenter  {
    
    // MARK: Properties
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireFrame: LoginWireFrameProtocol?
    
    func saveAdminforOnce() {
        interactor?.saveAdminforOnce()
    }
    
    func goToRegister() {
        wireFrame?.goToRegister(from: view!)
    }
    
    func login(nickname: String, password: String) {
        do {
            try interactor?.login(nickname: nickname, password: password)
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }
    
    func goToUsersList(){
        wireFrame?.goToUsersList(from: view!)
    }
    
    func goToUserData(user: UserApp) {
        wireFrame?.goToUserData(user: user, from:view!)
    }
    
}

extension LoginPresenter: LoginPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
