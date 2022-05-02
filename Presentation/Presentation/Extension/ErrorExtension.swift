//
//  ErrorExtension.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 1/05/22.
//

extension Error {
    func messageDescription() -> String {
        let errorString = String(describing: self)
        let arrString = errorString.split(separator: "\"")
        return String(arrString[1])
    }
}
