//
//  RegisterProtocols.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain
import UIKit

protocol RegisterViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: RegisterPresenterProtocol? { get set }
    func showAlert(message: String)
    func goBack()
}

protocol RegisterWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createRegisterModule() -> UIViewController
}

protocol RegisterPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: RegisterViewProtocol? { get set }
    var interactor: RegisterInteractorInputProtocol? { get set }
    var wireFrame: RegisterWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func saveUser(names: String, surnames: String, documentType: DocumentType, documentNumber: String, nickname: String, password: String)
}

protocol RegisterInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func goBack()
}

protocol RegisterInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: RegisterInteractorOutputProtocol? { get set }
    func saveUser(user: UserApp)
}
