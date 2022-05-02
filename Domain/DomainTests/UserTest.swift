//
//  UserTest.swift
//  DomainTests
//
//  Created by Arlin Lisette Ropero Infante on 30/04/22.
//

import XCTest
@testable import Domain

class UserTest: XCTestCase {
    
    func test_namesEmptyVerification_error() {
        // Arrange
        let names = ""
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "ips12345"
        // Act
        // Assert
        do {
            _ = try UserApp( uid: 01,
                             names: names,
                             surnames: surnames,
                             documentType: documentType,
                             documentNumber: documentNumber,
                             nickname: nickname,
                             password: password,
                             role: .Client
            )
        } catch let error {
            XCTAssertEqual("Verifica que no este vacío el campo con tus nombres", error.messageDescription())
        }
    }

    func test_surnamesEmptyVerification_error() {
        // Arrange
        let names = "Arlin"
        let surnames = ""
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "ips12345"
        // Act
        // Assert
        do {
            _ = try UserApp( uid: 01,
                             names: names,
                             surnames: surnames,
                             documentType: documentType,
                             documentNumber: documentNumber,
                             nickname: nickname,
                             password: password,
                             role: .Client
            )
        } catch let error {
            XCTAssertEqual("Verifica que no este vacío el campo con tus apellidos", error.messageDescription())
        }
    }
    
    func test_documentTypeEmptyVerification_error() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.none
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "ips12345"
        // Act
        // Assert
        do {
            _ = try UserApp( uid: 01,
                             names: names,
                             surnames: surnames,
                             documentType: documentType,
                             documentNumber: documentNumber,
                             nickname: nickname,
                             password: password,
                             role: .Client
            )
        } catch let error {
            XCTAssertEqual("Verifica que no este vacío el campo con el tipo de documento", error.messageDescription())
        }
    }
        
    func test_documentNumberEmptyVerification_error() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = ""
        let nickname = "arlin.ropero"
        let password = "ips12345"
        // Act
        // Assert
        do {
            _ = try UserApp( uid: 01,
                             names: names,
                             surnames: surnames,
                             documentType: documentType,
                             documentNumber: documentNumber,
                             nickname: nickname,
                             password: password,
                             role: .Client
            )
        } catch let error {
            XCTAssertEqual("Verifica que no este vacío el campo con tu número de documento", error.messageDescription())
        }
    }
            
    func test_nicknameEmptyVerification_error() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = ""
        let password = "ips12345"
        // Act
        // Assert
        do {
            _ = try UserApp( uid: 01,
                             names: names,
                             surnames: surnames,
                             documentType: documentType,
                             documentNumber: documentNumber,
                             nickname: nickname,
                             password: password,
                             role: .Client
            )
        } catch let error {
            XCTAssertEqual("Verifica que no este vacío el campo con tu usuario", error.messageDescription())
        }
    }
                
    func test_passwordEmptyVerification_error() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = ""
        // Act
        // Assert
        do {
            _ = try UserApp( uid: 01,
                             names: names,
                             surnames: surnames,
                             documentType: documentType,
                             documentNumber: documentNumber,
                             nickname: nickname,
                             password: password,
                             role: .Client
            )
        } catch let error {
            XCTAssertEqual("Verifica que no este vacío el campo con tu contraseña", error.messageDescription())
        }
    }
    
    func test_passwordLenghtVerificationWithShortPassword_error() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df"
        // Act
        // Assert
        do {
            _ = try UserApp( uid: 01,
                             names: names,
                             surnames: surnames,
                             documentType: documentType,
                             documentNumber: documentNumber,
                             nickname: nickname,
                             password: password,
                             role: .Client
            )
        } catch let error {
            XCTAssertEqual("La contraseña es muy corta, debe tener 8 o más caracteres.", error.messageDescription())
        }
    }
    
    func test_passwordLenghtVerificationWithShortPasswordWith8CharPassword_success() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./"
        // Act
        // Assert
        XCTAssertNoThrow(try UserApp( uid: 01,
                                      names: names,
                                      surnames: surnames,
                                      documentType: documentType,
                                      documentNumber: documentNumber,
                                      nickname: nickname,
                                      password: password,
                                      role: .Client ))
    }
    
    func test_passwordLenghtVerificationWithShortPasswordWithLongPassword_success() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./+"
        // Act
        // Assert
        XCTAssertNoThrow(try UserApp( uid: 01,
                                      names: names,
                                      surnames: surnames,
                                      documentType: documentType,
                                      documentNumber: documentNumber,
                                      nickname: nickname,
                                      password: password,
                                      role: .Client ))
    }

    func test_namesGetterVerification_Success() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./+"
        // Act
        let user = try! UserApp( uid: 01,
                                 names: names,
                                 surnames: surnames,
                                 documentType: documentType,
                                 documentNumber: documentNumber,
                                 nickname: nickname,
                                 password: password,
                                 role: .Client)
        //Assert
        XCTAssertEqual(user.getNames(), names)
    }

    func test_surnamesGetterVerification_Success() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./+"
        // Act
        let user = try! UserApp( uid: 01,
                                 names: names,
                                 surnames: surnames,
                                 documentType: documentType,
                                 documentNumber: documentNumber,
                                 nickname: nickname,
                                 password: password,
                                 role: .Client)
        //Assert
        XCTAssertEqual(user.getSurnames(), surnames)
    }

    func test_documentTypeGetterVerification_Success() {
        // Arrange
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./+"
        // Act
        let user = try! UserApp( uid: 01,
                                 names: names,
                                 surnames: surnames,
                                 documentType: documentType,
                                 documentNumber: documentNumber,
                                 nickname: nickname,
                                 password: password,
                                 role: .Client)
        //Assert
        XCTAssertEqual(user.getDocumentType(), documentType)
    }

    func test_documentNumberGetterVerification_Success() {
        // Arrange
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./+"
        // Act
        let user = try! UserApp( uid: 01,
                                 names: names,
                                 surnames: surnames,
                                 documentType: documentType,
                                 documentNumber: documentNumber,
                                 nickname: nickname,
                                 password: password,
                                 role: .Client)
        //Assert
        XCTAssertEqual(user.getDocumentNumber(), documentNumber)
    }

    func test_nicknameGetterVerification_Success() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./+"
        // Act
        let user = try! UserApp( uid: 01,
                                 names: names,
                                 surnames: surnames,
                                 documentType: documentType,
                                 documentNumber: documentNumber,
                                 nickname: nickname,
                                 password: password,
                                 role: .Client)
        //Assert
        XCTAssertEqual(user.getNickname(), nickname)
    }

    func test_passwordGetterVerification_Success() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./+"
        // Act
        let user = try! UserApp( uid: 01,
                                 names: names,
                                 surnames: surnames,
                                 documentType: documentType,
                                 documentNumber: documentNumber,
                                 nickname: nickname,
                                 password: password,
                                 role: .Client)
        //Assert
        XCTAssertEqual(user.getPassword(), password)
    }
    
    func test_changeNamesVerification_Success() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./+"
        let newNames = "Lisette"
        // Act
        let user = try! UserApp( uid: 01,
                                 names: names,
                                 surnames: surnames,
                                 documentType: documentType,
                                 documentNumber: documentNumber,
                                 nickname: nickname,
                                 password: password,
                                 role: .Client)
        user.set(names: newNames)
        //Assert
        XCTAssertEqual(user.getNames(), newNames)
    }
    
    func test_changeSurnamesVerification_Success() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./+"
        let newSurnames = "Infante"
        // Act
        let user = try! UserApp( uid: 01,
                                 names: names,
                                 surnames: surnames,
                                 documentType: documentType,
                                 documentNumber: documentNumber,
                                 nickname: nickname,
                                 password: password,
                                 role: .Client)
        user.set(surnames: newSurnames)
        //Assert
        XCTAssertEqual(user.getSurnames(), newSurnames)
    }
    
    func test_changePasswordVerification_Success() {
        // Arrange
        let names = "Arlin"
        let surnames = "Ropero"
        let documentType = DocumentType.CC
        let documentNumber = "1018048250"
        let nickname = "arlin.ropero"
        let password = "1254df./+"
        let newPassword = "7894dfg*"
        // Act
        let user = try! UserApp( uid: 01,
                                 names: names,
                                 surnames: surnames,
                                 documentType: documentType,
                                 documentNumber: documentNumber,
                                 nickname: nickname,
                                 password: password,
                                 role: .Client)
        user.set(password: newPassword)
        //Assert
        XCTAssertEqual(user.getPassword(), newPassword)
    }
}
