//
//  UsersListProtocols.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain
import UIKit

protocol UsersListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: UsersListPresenterProtocol? { get set }
    func showAlert(message: String)
    func showUsers(users: [UserApp])
}

protocol UsersListWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createUsersListModule() -> UIViewController
    func goToUserData(user: UserApp, from view: UsersListViewProtocol)
}

protocol UsersListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: UsersListViewProtocol? { get set }
    var interactor: UsersListInteractorInputProtocol? { get set }
    var wireFrame: UsersListWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func getAllUsers()
    func deleteUser(_ user: UserApp)
    func goToUserData(_ user: UserApp)
}

protocol UsersListInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func showUsers(users: [UserApp])
}

protocol UsersListInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: UsersListInteractorOutputProtocol? { get set }
    func getAllUsers() throws
    func deleteUser(_ user: UserApp) throws
}
