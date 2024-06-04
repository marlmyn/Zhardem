//
//  OTPResponse.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 04.06.2024.
//

import Foundation

struct OTPResponse: Codable {
    let accessToken: String?
    let refreshToken: String?
    let userId: Int?
    let errorMessage: String?
}

