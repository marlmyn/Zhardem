//
//  ImageView.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 09.04.2024.
//

import UIKit

class ImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(frame: .zero)
        
    //    UIImageView(image: image)
        contentMode = .scaleAspectFit
        setWidth(width: 32)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
