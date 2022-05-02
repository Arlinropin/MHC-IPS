//
//  UsersListWireFrame.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain
import UIKit

class UsersListWireFrame: UsersListWireFrameProtocol {

    class func createUsersListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "UsersListView")
        if let view = navController as? UsersListView {
            let presenter: UsersListPresenterProtocol & UsersListInteractorOutputProtocol = UsersListPresenter()
            let interactor: UsersListInteractorInputProtocol = UsersListInteractor()
            let wireFrame: UsersListWireFrameProtocol = UsersListWireFrame()
            
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
    
    func goToUserData(user: UserApp, from view: UsersListViewProtocol) {
        let new = UserDataWireFrame.createUserDataModule(user: user)
        if let newView = view as? UIViewController {
            newView.navigationController?.pushViewController(new, animated: true)
        }
    }
    
}
