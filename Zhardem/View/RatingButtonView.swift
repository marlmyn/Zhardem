//
//  RatingButtonView.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 06.06.2024.
//

import UIKit

class RatingButtonView: UIButton {
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "star.fill") // Assuming using SF Symbol
        imageView.tintColor = UIColor(red: 78/255, green: 175/255, blue: 160/255, alpha: 1.0) // The green color from the screenshot
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 78/255, green: 175/255, blue: 160/255, alpha: 1.0) // The green color from the screenshot
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "4.7"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Set background color and corner radius to match the card appearance
        self.backgroundColor = UIColor(red: 229/255, green: 241/255, blue: 237/255, alpha: 1.0) // Light green background from the screenshot
        self.layer.cornerRadius = 8
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews
        self.addSubview(starImageView)
        self.addSubview(ratingLabel)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            // Star ImageView Constraints
            starImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            starImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            starImageView.widthAnchor.constraint(equalToConstant: 20),
            starImageView.heightAnchor.constraint(equalToConstant: 20),
            
            // Rating Label Constraints
            ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 4),
            ratingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            ratingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    // Optionally, add a method to set the rating dynamically
    func setRating(_ rating: String) {
        ratingLabel.text = rating
    }
}
