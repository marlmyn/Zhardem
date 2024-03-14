//
//  SocialButton.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 12.03.2024.
//

import UIKit

class SocialButton: UIButton {
    
    init (image: UIImage, title: String) {
        super.init(frame: .zero)
        
        setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        layer.borderColor = UIColor.systemGray3.cgColor
        layer.borderWidth = 1.0
        setHeight(height: 56)
        layer.cornerRadius = 24
        setTitle(title, for: .normal)
        setTitleColor(UIColor(red: 0, green: 0, blue: 0.5, alpha: 1), for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
       // configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
