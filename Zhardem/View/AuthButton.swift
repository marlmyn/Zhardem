//
//  AuthButton.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 12.03.2024.
//

import UIKit

class AuthButton: UIButton {
    
    var title: String? {
        didSet {
            setTitle(title, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 24
        backgroundColor = UIColor(red: 0.7255, green: 0.8627, blue: 0.9490, alpha: 1.0)
        setTitleColor(.white, for: .normal)
        setHeight(height: 56)
        isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
