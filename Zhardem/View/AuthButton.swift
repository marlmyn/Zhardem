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
        backgroundColor = Color.authButton
        setTitleColor(.white, for: .normal)
        setHeight(height: 56)
        isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
