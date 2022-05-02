//
//  UserDataWireFrame.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Foundation
import UIKit
import Domain

class UserDataWireFrame: UserDataWireFrameProtocol {

    class func createUserDataModule(user: UserApp) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "UserDataView")
        if let view = navController as? UserDataView {
            let presenter: UserDataPresenterProtocol & UserDataInteractorOutputProtocol = UserDataPresenter()
            let interactor: UserDataInteractorInputProtocol = UserDataInteractor()
            let wireFrame: UserDataWireFrameProtocol = UserDataWireFrame()
            
            view.presenter = presenter
            view.user = user
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
    
}
