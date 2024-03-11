//
//  CustomTextFiels.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 11.03.2024.
//

import UIKit

class CustomTextFiels: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
       
        font = UIFont.systemFont(ofSize: 16)
        textColor = UIColor.black
        keyboardAppearance = .light
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
