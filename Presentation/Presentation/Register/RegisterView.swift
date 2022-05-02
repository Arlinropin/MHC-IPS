//
//  RegisterView.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Foundation
import UIKit
import Domain

class RegisterView: UIViewController {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var documentTypeTextField: UITextField!
    @IBOutlet weak var documentNumberTextField: UITextField!
    @IBOutlet weak var namesTextField: UITextField!
    @IBOutlet weak var surnamesTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var documentTypeButton: UIButton!
    
    // MARK: Properties
    var presenter: RegisterPresenterProtocol?
    var currentDocumentType: DocumentType = .none
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        box.layer.cornerRadius = 20
        configureListButton()
        documentNumberTextField.keyboardType = .numberPad
    }
    
    // MARK: - Set Document Type List
    func configureDocumentTypeListButton(handler: @escaping (DocumentType) -> Void) {
        documentTypeButton.menu = setMenu(handler: handler)
        documentTypeButton.showsMenuAsPrimaryAction = true
    }
    
    func setMenu(handler: @escaping (DocumentType) -> Void) -> UIMenu {
        return UIMenu(title: "",
                      image: nil,
                      identifier: nil,
                      options: [],
                      children: setDocumentTypeMenuItems(handler: handler))
    }
    
    func setDocumentTypeMenuItems(handler: @escaping (DocumentType) -> Void) -> [UIAction] {
        var itemsMenu: [UIAction] = []
        for type in DocumentType.allCases {
            if !type.rawValue.isEmpty {
                let item = UIAction(title: type.rawValue,
                                    handler: {_ in handler(type)})
                itemsMenu.append(item)}
        }
        return itemsMenu
    }
    
    func configureListButton() {
        configureDocumentTypeListButton(handler: { [self] type in
            actionItemDocumentType(with: type)
        })
    }

    func actionItemDocumentType(with type: DocumentType) {
        documentTypeTextField.text = "\(type.rawValue)"
        currentDocumentType = type
    }
    
    // MARK: - Actions
    @IBAction func registerUser(_ sender: UIButton) {
        presenter?.saveUser(names: namesTextField.text ?? "",
                            surnames: surnamesTextField.text ?? "",
                            documentType: currentDocumentType,
                            documentNumber: documentNumberTextField.text ?? "",
                            nickname: nicknameTextField.text ?? "",
                            password: passwordTextField.text ?? "")
    }
    
    // MARK: - Functions
    func goBack() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Alert
    func showAlert(message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            let alert = UIAlertController(title: "¡Lo sentimos!",
                                          message: message,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension RegisterView: RegisterViewProtocol {
    // TODO: implement view output methods
}
