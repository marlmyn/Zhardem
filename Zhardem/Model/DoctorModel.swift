//
//  DoctorModel.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 13.04.2024.
//

import UIKit

struct DoctorModel: Codable {
    let fullName: String
    let imagePath: String
    let specialization: String
    let rating, distance: Double
}

typealias DoctorList = [DoctorModel]

