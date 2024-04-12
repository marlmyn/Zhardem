//
//  TextLabel.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 09.04.2024.
//

import UIKit

class TextLabel: UILabel {
    
    init(textLabel: String, size: Int){
        super.init(frame: .zero)
        
        text = textLabel
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: CGFloat(size), weight: .semibold)
        sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
