//
//  UsersListPresenter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain

class UsersListPresenter  {
    
    // MARK: Properties
    weak var view: UsersListViewProtocol?
    var interactor: UsersListInteractorInputProtocol?
    var wireFrame: UsersListWireFrameProtocol?
    
    func showUsers(users: [UserApp]) {
        view?.showUsers(users: users)
    }
    
    func getAllUsers() {
        do {
            try interactor?.getAllUsers()
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }
    
    func deleteUser(_ user: UserApp){
        do {
            try interactor?.deleteUser(user)
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }
    
    func goToUserData(_ user: UserApp){
        wireFrame?.goToUserData(user: user, from: view!)
    }
}

extension UsersListPresenter: UsersListPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension UsersListPresenter: UsersListInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
