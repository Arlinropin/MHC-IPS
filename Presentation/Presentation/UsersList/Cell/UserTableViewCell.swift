//
//  UserTableViewCell.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//

import UIKit
import Domain

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var userDataLabel: UILabel!
    @IBOutlet weak var userLogo: UIImageView!

    var callbackDelete: (UserApp?) -> Void = {user in }
    var callbackUpdate: (UserApp?) -> Void = {user in }
    var currentUser: UserApp?
    
    func initWithData(user: UserApp) {
        box.layer.cornerRadius = 20
        let text = """
        ID: 0\(user.getUid())
        \(user.getDocumentType().rawValue) \(user.getDocumentNumber())
        Nombres: \(user.getNames())
        Apellidos: \(user.getSurnames())
        Usuario: \(user.getNickname())
        Ingreso el día: \(user.getCreationDate().formatHour())
        """
        userDataLabel.text = text
        userLogo.image = user.getRole() == .Admin ?  #imageLiteral(resourceName: "admin-icon"): #imageLiteral(resourceName: "client-icon")
        currentUser = user
    }
    
    @IBAction func deleteUser(_ sender: UIButton) {
        callbackDelete(currentUser)
    }
    
    @IBAction func updateUser(_ sender: UIButton) {
        callbackUpdate(currentUser)
    }
}
