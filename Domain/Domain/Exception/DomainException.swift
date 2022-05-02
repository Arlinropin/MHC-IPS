//
//  DomainException.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante on 30/04/22.
//

import Foundation

public enum DomainException: Error {
    case CarLimitReached(message: String = "Has llegado al límite de cantidad de carros permitido")
    case namesEmpty(message: String = "Verifica que no este vacío el campo con tus nombres")
    case surnamesEmpty(message: String = "Verifica que no este vacío el campo con tus apellidos")
    case documentTypeEmpty(message: String = "Verifica que no este vacío el campo con el tipo de documento")
    case documentNumberEmpty(message: String = "Verifica que no este vacío el campo con tu número de documento")
    case nicknameEmpty(message: String = "Verifica que no este vacío el campo con tu usuario")
    case passwordEmpty(message: String = "Verifica que no este vacío el campo con tu contraseña")
    case passwordShort(message: String = "La contraseña es muy corta, debe tener 8 o más caracteres.")
    
    case userNoExist(message: String = "El usuario no existe o los datos ingresados son incorrectos.")
    case userExist(message: String = "El usuario ya existe.")
}
