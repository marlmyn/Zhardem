//
//  RegisterModel.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 02.04.2024.
//

import UIKit

struct RegisterModel: Encodable {
    let fullName: String
    let email: String
    let password: String
}

// MARK: - ResponseModel
struct ResponseModel: Codable {
    let accessToken, refreshToken: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case accessToken, refreshToken
        case userID = "userId"
    }
}

