//
//  UserDataPresenter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Foundation
import Domain

class UserDataPresenter  {
    
    // MARK: Properties
    weak var view: UserDataViewProtocol?
    var interactor: UserDataInteractorInputProtocol?
    var wireFrame: UserDataWireFrameProtocol?
    
    func update(user: UserApp?, withNames names: String?, surnames: String?, password: String?) {
        do {
            let newNames = (names == "" ? user?.getNames() ?? "":names) ?? ""
            let newSurnames = (surnames == "" ? user?.getSurnames() ?? "":surnames) ?? ""
            let newPassword = (password == "" ? user?.getPassword() ?? "":password) ?? ""
            let user = try UserApp( uid: user?.getUid() ?? 0,
                                    names: newNames,
                                    surnames: newSurnames,
                                    documentType: user?.getDocumentType() ?? .none,
                                    documentNumber: user?.getDocumentNumber() ?? "",
                                    nickname: user?.getNickname() ?? "",
                                    password: newPassword,
                                    role: user?.getRole() ?? .Client)
            try interactor?.getUpdateUser(newUser: user)
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }
    
    func goBack() {
        view?.goBack()
    }
}

extension UserDataPresenter: UserDataPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension UserDataPresenter: UserDataInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
