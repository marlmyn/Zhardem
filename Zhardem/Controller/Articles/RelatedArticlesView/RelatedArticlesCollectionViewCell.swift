//
//  RelatedArticlesCollectionViewCell.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 06.06.2024.
//

import UIKit

class RelatedArticlesCollectionViewCell: UICollectionViewCell {
    static let reuseId = "RelatedArticlesCollectionViewCell"
    
    let articleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let articleTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.textColor = UIColor.systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = UIColor(red: 0.7255, green: 0.8627, blue: 0.9490, alpha: 1.0)
        
        addSubview(articleImage)
        addSubview(articleTitle)
        addSubview(detailLabel)
        
        
        articleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        articleImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        
        articleImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        articleImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        articleTitle.leadingAnchor.constraint(equalTo: articleImage.trailingAnchor, constant: 10).isActive = true
        articleTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        articleTitle.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        
        
        detailLabel.leadingAnchor.constraint(equalTo: articleImage.trailingAnchor, constant: 10).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        detailLabel.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 4).isActive = true
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 12
        layer.borderColor =  Color.authButton.cgColor
        layer.borderWidth = 1.0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
