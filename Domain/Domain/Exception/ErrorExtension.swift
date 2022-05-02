//
//  ErrorExtension.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante on 30/04/22.
//

extension Error {
    func messageDescription() -> String {
        let errorString = String(describing: self)
        let arrString = errorString.split(separator: "\"")
        return String(arrString[1])
    }
}
