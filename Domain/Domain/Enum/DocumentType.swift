//
//  DocumentType.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante on 30/04/22.
//

public enum DocumentType: String, CaseIterable {
    case NUIP = "Registro civil de nacimiento"
    case TI = "Tarjeta de identidad"
    case CC = "Cédula de ciudadanía"
    case CE = "Cédula de extranjería"
    case Passport = "Pasaporte"
    case none = ""
}
