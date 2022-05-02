//
//  LoginWireFrame.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Foundation
import UIKit
import Domain

class LoginWireFrame: LoginWireFrameProtocol {

    class func createLoginModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "LoginView")
        if let view = navController as? LoginView {
            let presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
            let interactor: LoginInteractorInputProtocol = LoginInteractor()
            let wireFrame: LoginWireFrameProtocol = LoginWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    func goToRegister(from view: LoginViewProtocol) {
        let new = RegisterWireFrame.createRegisterModule()
        if let newView = view as? UIViewController {
            newView.navigationController?.pushViewController(new, animated: true)
        }
    }
    
    func goToUsersList(from view: LoginViewProtocol) {
        let new = UsersListWireFrame.createUsersListModule()
        if let newView = view as? UIViewController {
            newView.navigationController?.pushViewController(new, animated: true)
        }
    }
    
    func goToUserData(user: UserApp, from view: LoginViewProtocol) {
        let new = UserDataWireFrame.createUserDataModule(user: user)
        if let newView = view as? UIViewController {
            newView.navigationController?.pushViewController(new, animated: true)
        }
    }
}
