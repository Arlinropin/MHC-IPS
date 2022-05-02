//
//  RegisterPresenter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Domain

class RegisterPresenter  {
    
    // MARK: Properties
    weak var view: RegisterViewProtocol?
    var interactor: RegisterInteractorInputProtocol?
    var wireFrame: RegisterWireFrameProtocol?
    
    func saveUser(names: String,
                  surnames: String,
                  documentType: DocumentType,
                  documentNumber: String,
                  nickname: String,
                  password: String
    ) {
        do {
            let user = try UserApp(uid: 0,
                                   names: names,
                                   surnames: surnames,
                                   documentType: documentType,
                                   documentNumber: documentNumber,
                                   nickname: nickname,
                                   password: password,
                                   role: .Client)
            interactor?.saveUser(user: user)
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
        
    }
    
    func goBack() {
        view?.goBack()
    }
}

extension RegisterPresenter: RegisterPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension RegisterPresenter: RegisterInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
