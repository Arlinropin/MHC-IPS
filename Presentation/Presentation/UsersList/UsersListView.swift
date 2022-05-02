//
//  UsersListView.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//  
//

import Foundation
import UIKit
import Domain

class UsersListView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    // MARK: Properties
    var presenter: UsersListPresenterProtocol?
    var users: [UserApp] = []
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "UserTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "UserTableViewCell")
        presenter?.getAllUsers()
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.initWithData(user: users[indexPath.row])
        cell.callbackDelete = { [self] user in deleteUser(user!)}
        cell.callbackUpdate = { [self] user in updateUser(user!)}
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - Functions
    func showUsers(users: [UserApp]) {
        self.users = users
        table.reloadData()
    }
    
    func deleteUser(_ user: UserApp) {
        presenter?.deleteUser(user)
    }
    
    func updateUser(_ user: UserApp) {
        presenter?.goToUserData(user)
    }
    
    // MARK: - Actions
    
    @IBAction func updateData(_ sender: UIButton) {
        presenter?.getAllUsers()
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

extension UsersListView: UsersListViewProtocol {
    // TODO: implement view output methods
}
