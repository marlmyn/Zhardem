//
//  DateCollectionViewCell.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 30.04.2024.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
  
        
        static let reuseId = "DateCollectionViewCell"
        
        private let dayLabel = UILabel()
        private let dateLabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupViews() {
            dayLabel.font = UIFont.systemFont(ofSize: 14)
            dayLabel.textAlignment = .center
            dateLabel.font = UIFont.boldSystemFont(ofSize: 18)
            dateLabel.textAlignment = .center
            
            let stackView = UIStackView(arrangedSubviews: [dayLabel, dateLabel])
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.distribution = .fillEqually
            
            addSubview(stackView)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            
            self.layer.cornerRadius = 15
            self.layer.borderWidth = 1
            self.layer.borderColor = Color.whiteGray.cgColor
        }
        
        public func configure(with day: String, date: String, isSelected: Bool) {
            dayLabel.text = day
            dateLabel.text = date
            self.backgroundColor = isSelected ? Color.authButton : .clear
            self.dateLabel.textColor = isSelected ? .white : .black
            self.dayLabel.textColor = isSelected ? .white : UIColor.lightGray
        }
    }


