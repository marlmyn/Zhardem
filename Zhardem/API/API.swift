//
//  API.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 02.04.2024.
//

import UIKit

let register_url = "https://zhadem-app-1.onrender.com/api/v1/auth/register"
let login_url = "https://zhadem-app-1.onrender.com/api/v1/auth/authenticate"
//let doctor_url = "https://sea-lion-app-usoaj.ondigitalocean.app/api/v1/doctor/\(id)"
let logout_url = "https://zhadem-app-1.onrender.com/api/v1/auth/logout"
let article_url = "https://zhadem-app-1.onrender.com/api/v1/article/trending"
let popularArticle_url = "https://zhadem-app-1.onrender.com/api/v1/article/popular"
let trendArticle_url = "https://zhadem-app-1.onrender.com/api/v1/article/related"
let relatedArticle_url = "https://zhadem-app-1.onrender.com/api/v1/article/related"

struct TokenKey {
    static let userLogin = "USER_LOGIN_KEY"
}
