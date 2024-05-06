//
//  TimeCollectionViewCell.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 30.04.2024.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    
        
        static let reuseId = "TimeCollectionViewCell"
        
        private let timeLabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    private func setupViews() {
           timeLabel.font = UIFont.systemFont(ofSize: 16)
           timeLabel.textAlignment = .center
           timeLabel.translatesAutoresizingMaskIntoConstraints = false
           addSubview(timeLabel)
           NSLayoutConstraint.activate([
               timeLabel.topAnchor.constraint(equalTo: topAnchor),
               timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
               timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
               timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
           ])
           
           layer.cornerRadius = 15
           layer.borderWidth = 1
           layer.borderColor = Color.whiteGray.cgColor
           backgroundColor = .clear
       }
       
       func configure(with time: String, isSelected: Bool) {
           timeLabel.text = time
           backgroundColor = isSelected ? Color.authButton : UIColor.clear
           timeLabel.textColor = isSelected ? UIColor.white : UIColor.black
       }
    }

    

