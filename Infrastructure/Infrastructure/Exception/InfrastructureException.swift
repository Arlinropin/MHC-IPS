//
//  InfrastructureException.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante on 1/05/22.
//

public enum InfrastructureException: Error {
    case ErrorSaving(message: String = "No fue posible agregar al usuario.")
    case ErrorUpdating(message: String = "No fue posible actualizar los datos.")
    case ErrorFetch(message: String = "No fue posible traer los registros.")
    case ErrorRemove(message: String = "No fue posible borrar el registro.")
}
