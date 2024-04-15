//
//  OnboardingViewController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 29.02.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    
    let imageView = UIImageView()
    let descriptionLabel = UILabel()

    
    init(imageName: UIImage, descriptionText: String) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = imageName
        descriptionLabel.text = descriptionText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
}

extension OnboardingViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 150
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 28)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = Color.textColor

    }
    
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descriptionLabel)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier:0.5 ),
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
            
        ])
    }
}
