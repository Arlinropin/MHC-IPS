//
//  UserApp.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante on 30/04/22.
//

import Foundation

public class UserApp {
// Condiciones requeridas para los usuarios estipuladas
//    Atributos de la IPS:
//      * Id: Número identificador (Ej: 01,02...., 093)
//      * Nombres: Nombre del paciente
//      * Apellidos: Apellidos
//      * Tipo de identificación: Cedula o Cedula extranjera
//      * Cedula: Número de identificación
//      * Fecha de Creación: Fecha en que se creó el usuario
//    Con estos usuarios se pueden crear un login los datos para el login son los siguientes:
//      * User: Nombre de usuario Alfanumérico
//      * Password: Contraseña

    private var uid: Int
    private var names: String
    private var surnames: String
    private var documentType: DocumentType
    private var documentNumber: String
    private var creationDate: Date
    private var nickname: String
    private var password: String
    private var role: Role
    
    // MARK: - Init
    public init( uid: Int,
                 names: String,
                 surnames: String,
                 documentType: DocumentType,
                 documentNumber: String,
                 nickname: String,
                 password: String,
                 role: Role) throws {
        
        self.uid = uid
        self.names = names
        self.surnames = surnames
        self.documentType = documentType
        self.documentNumber = documentNumber
        self.creationDate = Date()
        self.nickname = nickname
        self.password = password
        self.role = role
        try areThereEmptyAttributes(
            names: names,
            surnames: surnames,
            documentType: documentType,
            documentNumber: documentNumber,
            nickname: nickname,
            password: password)
        try isAValidPassword(password)
    }
    
    // MARK: - GET's
    public func getUid() -> Int {
        return uid }
    public func getNames() -> String {
        return names }
    public func getSurnames() -> String {
        return surnames }
    public func getDocumentType() -> DocumentType {
        return documentType }
    public func getDocumentNumber() -> String {
        return documentNumber }
    public func getCreationDate() -> Date {
        return creationDate }
    public func getNickname() -> String {
        return nickname }
    public func getPassword() -> String {
        return password }
    public func getRole() -> Role {
        return role }
    
    // MARK: - SET's
    public func set(names: String) {
        self.names = names }
    public func set(surnames: String) {
        self.surnames = surnames }
    public func set(password: String) {
        self.password = password }
    
    // MARK: - Validations
    private func areThereEmptyAttributes( names: String,
                                          surnames: String,
                                          documentType: DocumentType,
                                          documentNumber: String,
                                          nickname: String,
                                          password: String ) throws {
        guard documentType != .none else {
            throw DomainException.documentTypeEmpty() }
        guard !documentNumber.isEmpty else {
            throw DomainException.documentNumberEmpty() }
        guard !names.isEmpty else {
            throw DomainException.namesEmpty() }
        guard !surnames.isEmpty else {
            throw DomainException.surnamesEmpty() }
        guard !nickname.isEmpty else {
            throw DomainException.nicknameEmpty() }
        guard !password.isEmpty else {
            throw DomainException.passwordEmpty() }
    }
    
    private func isAValidPassword(_ password: String) throws {
        guard password.count > 7 else {
            throw DomainException.passwordShort() }
    }
}
