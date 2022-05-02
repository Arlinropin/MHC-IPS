//
//  UserDataProtocols.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain
import UIKit

protocol UserDataViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: UserDataPresenterProtocol? { get set }
    func showAlert(message: String)
    func goBack()
}

protocol UserDataWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createUserDataModule(user: UserApp) -> UIViewController
}

protocol UserDataPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: UserDataViewProtocol? { get set }
    var interactor: UserDataInteractorInputProtocol? { get set }
    var wireFrame: UserDataWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func update(user: UserApp?, withNames names: String?, surnames: String?, password: String?)
}

protocol UserDataInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func goBack()
}

protocol UserDataInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: UserDataInteractorOutputProtocol? { get set }
    func getUpdateUser(newUser: UserApp) throws
}
