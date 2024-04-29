//
//  TopDoctorCollectionViewCell.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 15.04.2024.
//

import UIKit

class TopDoctorCollectionViewCell: UICollectionViewCell {
    static let reuseId = "TopDoctorCollectionViewCell"
    
    let doctorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let specialLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rateImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.Doctor.rate
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.Doctor.location
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = UIColor(red: 0.7255, green: 0.8627, blue: 0.9490, alpha: 1.0)
        
        addSubview(doctorImage)
        addSubview(fullNameLabel)
        addSubview(specialLabel)
        addSubview(rateImage)
        addSubview(rateLabel)
        addSubview(locationImage)
        addSubview(distanceLabel)
        
        doctorImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        doctorImage.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        
        doctorImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        doctorImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        fullNameLabel.leadingAnchor.constraint(equalTo: doctorImage.trailingAnchor, constant: 10).isActive = true
        fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        
        
        specialLabel.leadingAnchor.constraint(equalTo: doctorImage.trailingAnchor, constant: 10).isActive = true
        specialLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        specialLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4).isActive = true
        
        rateImage.leadingAnchor.constraint(equalTo: doctorImage.trailingAnchor, constant: 10).isActive = true
        rateImage.topAnchor.constraint(equalTo: specialLabel.bottomAnchor, constant: 12).isActive = true
        rateImage.widthAnchor.constraint(equalToConstant: 12).isActive = true
        rateImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        rateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -176).isActive = true
        rateLabel.centerYAnchor.constraint(equalTo: rateImage.centerYAnchor).isActive = true
        
        
        locationImage.leadingAnchor.constraint(equalTo: doctorImage.trailingAnchor, constant: 10).isActive = true
        locationImage.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 12).isActive = true
        locationImage.widthAnchor.constraint(equalToConstant: 10).isActive = true
        locationImage.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        distanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -136).isActive = true
        distanceLabel.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 12
        layer.borderColor =  Color.cardView.cgColor
        layer.borderWidth = 1.0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
