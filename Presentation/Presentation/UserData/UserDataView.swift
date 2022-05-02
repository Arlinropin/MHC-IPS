//
//  UserDataView.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Foundation
import UIKit
import Domain

class UserDataView: UIViewController {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userDataLabel: UILabel!
    @IBOutlet weak var namesTextField: UITextField!
    @IBOutlet weak var surnamesTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: Properties
    var presenter: UserDataPresenterProtocol?
    var user: UserApp?
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = user?.getRole() == .Client ? "Tus datos": "Datos del usuario"
        let text = """
        ID: 0\(user?.getUid() ?? 00)
        \(user?.getDocumentType().rawValue ?? "") \(user?.getDocumentNumber() ?? "")
        Nombres: \(user?.getNames() ?? "")
        Apellidos: \(user?.getSurnames() ?? "")
        Usuario: \(user?.getNickname() ?? "")
        Ingreso el día: \((user?.getCreationDate() ?? Date()).formatHour())
        """
        userDataLabel.text = text
    }
    
    // MARK: - Actions
    @IBAction func updateUser(_ sender: UIButton) {
        presenter?.update(user: user,
                          withNames: namesTextField.text,
                          surnames: surnamesTextField.text,
                          password: passwordTextField.text)
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

extension UserDataView: UserDataViewProtocol {
    // TODO: implement view output methods
}
