//
//  AuthenticationViewModel.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 18.03.2024.
//

import UIKit

protocol FormViewModel {
    func updateForm()
}

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
    var shouldEnableButton: Bool { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
           && password?.isEmpty == false
    }
    
    var shouldEnableButton: Bool {
        return formIsValid
    }
}

struct RegistrationViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    var fullName: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
           && password?.isEmpty == false
           && fullName?.isEmpty == false
    }
    
    var shouldEnableButton: Bool {
        return formIsValid
    }
}

struct ResetPasswordViewModel: AuthenticationViewModel {
    var email: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
    }
    
    var shouldEnableButton: Bool {
        return formIsValid
    } 
}
