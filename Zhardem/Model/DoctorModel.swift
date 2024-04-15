//
//  DoctorModel.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 13.04.2024.
//

import UIKit

struct DoctorModel {
    
    var image: UIImage
    var fullName: String
    var specialization: String
    var rating: Double
    var distance: Int
    
    static func fetchDoctor() -> [DoctorModel] {
        let firstItem = DoctorModel(image: Images.Doctor.doctor2,
                                    fullName: "Dr. Marcus Horizon",
                                    specialization: "Chardiologist",
                                    rating: 4.8,
                                    distance: 800)
        let secondItem = DoctorModel(image: Images.Doctor.doctor3,
                                     fullName: "Dr. Maria Elena",
                                     specialization: "Psychologist",
                                     rating: 4.7,
                                     distance: 800)
        let thirdItem = DoctorModel(image: Images.Doctor.doctor4,
                                    fullName: "Dr. Stefi Jessi",
                                    specialization: "Orthopedist",
                                    rating: 4.7,
                                    distance: 800)
        let fourthItem = DoctorModel(image: Images.Doctor.doctor5,
                                     fullName: "Dr. Gerty Cori",
                                     specialization: "Orthopedist",
                                     rating: 4.7,
                                     distance: 800)
        
        return [firstItem, secondItem, thirdItem, fourthItem]
    }
    
}
