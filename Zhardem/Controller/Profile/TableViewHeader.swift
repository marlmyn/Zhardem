//
//  TableViewHeader.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 19.04.2024.
//

import UIKit

class TableViewHeader: UIView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.Profile.profileImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Akmaral Ergesh"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = Color.textColor
        return label
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        let image = Images.Profile.settingsIcon
        button.setImage(image, for: .normal)
       // button.setWidth(width: 20)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(settingsButton)
        addSubview(imageView)
        addSubview(nameLabel)
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            settingsButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            settingsButton.heightAnchor.constraint(equalToConstant: 20),
            
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: settingsButton.topAnchor, constant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 140),
            
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12)
            
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

