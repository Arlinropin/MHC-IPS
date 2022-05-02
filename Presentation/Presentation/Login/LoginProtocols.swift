//
//  LoginProtocols.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain
import UIKit

protocol LoginViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: LoginPresenterProtocol? { get set }
    func showAlert(message: String)
}

protocol LoginWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createLoginModule() -> UIViewController
    func goToRegister(from view: LoginViewProtocol)
    func goToUsersList(from view: LoginViewProtocol)
    func goToUserData(user: UserApp, from view: LoginViewProtocol)
}

protocol LoginPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorInputProtocol? { get set }
    var wireFrame: LoginWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func saveAdminforOnce()
    func goToRegister()
    func login(nickname: String, password: String)
}

protocol LoginInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func goToUsersList()
    func goToUserData(user: UserApp)
}

protocol LoginInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: LoginInteractorOutputProtocol? { get set }
    func saveAdminforOnce()
    func login(nickname: String, password: String) throws
}
