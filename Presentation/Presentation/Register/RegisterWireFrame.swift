//
//  RegisterWireFrame.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Foundation
import UIKit

class RegisterWireFrame: RegisterWireFrameProtocol {

    class func createRegisterModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "RegisterView")
        if let view = navController as? RegisterView {
            let presenter: RegisterPresenterProtocol & RegisterInteractorOutputProtocol = RegisterPresenter()
            let interactor: RegisterInteractorInputProtocol = RegisterInteractor()
            let wireFrame: RegisterWireFrameProtocol = RegisterWireFrame()
            
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
    
}
