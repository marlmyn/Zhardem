//
//  PopularArticlesCollectionViewCell.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 05.06.2024.
//

import UIKit

class PopularArticlesCollectionViewCell: UICollectionViewCell {
    static let reuseId = "PopularArticlesCollectionViewCell"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = UIColor(red: 0.7255, green: 0.8627, blue: 0.9490, alpha: 1.0)
       // nameLabel.numberOfLines = 2
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(nameLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
           // nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8)
            
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 12
        layer.borderColor =  Color.cardView.cgColor
        layer.borderWidth = 1.0
        backgroundColor = Color.authButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
