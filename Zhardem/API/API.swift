//
//  API.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 02.04.2024.
//

import UIKit

let register_url = "https://sea-lion-app-usoaj.ondigitalocean.app/api/v1/auth/register"
let login_url = "https://sea-lion-app-usoaj.ondigitalocean.app/api/v1/auth/authenticate"
//let doctor_url = "https://sea-lion-app-usoaj.ondigitalocean.app/api/v1/doctor/\(id)"
let logout_url = "https://sea-lion-app-usoaj.ondigitalocean.app/api/v1/auth/logout"
let article_url = "https://sea-lion-app-usoaj.ondigitalocean.app/api/v1/article/trending"

struct TokenKey {
    static let userLogin = "USER_LOGIN_KEY"
}
