//
//  LoginView.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Foundation
import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: Properties
    var presenter: LoginPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        box.layer.cornerRadius = 20
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.saveAdminforOnce()
    }
    
    @IBAction func goToRegister(_ sender: UIButton) {
        presenter?.goToRegister()
    }
    
    @IBAction func login(_ sender: UIButton) {
        presenter?.login(nickname: userTextField.text ?? "", password: passwordTextField.text ?? "")
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

extension LoginView: LoginViewProtocol {
    // TODO: implement view output methods
}
