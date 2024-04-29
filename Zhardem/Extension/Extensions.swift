//
//  Extensions.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 11.03.2024.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil ){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor, let padding = paddingTop {
            self.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superviewTopAnchor = superview?.topAnchor,
              let superviewBottomAnchor = superview?.bottomAnchor,
              let superviewLeadingAnchor = superview?.leadingAnchor,
              let superviewTrailingAnchor =  superview?.trailingAnchor
        else { return }
        
        anchor(top: superviewTopAnchor, left: superviewLeadingAnchor,
               bottom: superviewBottomAnchor, right: superviewTrailingAnchor)
    }
    
    //  Container for auth
    func inputContainerView(image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        view.backgroundColor = Color.whiteGray1
        view.layer.borderColor = Color.whiteGray.cgColor
        view.layer.borderWidth = 1.0
        view.setHeight(height: 56)
        view.layer.cornerRadius = 24
        let imageView = UIImageView()
        imageView.image = image
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 16, width: 24, height: 24)
        
        view.addSubview(textField)
        textField.centerY(inView: view)
        textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor,
                         right: view.rightAnchor, paddingLeft: 16, paddingBottom: 8)
        return view
    }
    
    //  Category
    func categoryView(image: UIImage, label: UILabel) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        imageView.anchor(top: view.topAnchor, paddingTop: 8)
        imageView.centerX(inView: view)
        imageView.setDimensions(height: 40, width: 40)
        
        view.addSubview(label)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.anchor(top: imageView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 4, paddingBottom: 4, paddingRight: 4)
        
        return view
    }
    
    //  Upcoming Schedule
    func upcomingSchedule(imageDoctor: UIImage, imageBell: UIImage, calendarImg: UIImage, labelName: UILabel,labelSpec: UILabel, labelDate: UILabel) -> UIView {
        let view = UIView()
        view.backgroundColor = Color.cardView
        layer.borderWidth = 1.0
        view.setHeight(height: 140)
        view.layer.cornerRadius = 10
        
        let doctorImages = UIImageView()
        doctorImages.image = imageDoctor
        doctorImages.contentMode = .scaleAspectFit
        view.addSubview(doctorImages)
        doctorImages.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 22, paddingLeft: 14, width: 80, height: 80)
        
        view.addSubview(labelName)
        labelName.numberOfLines = 0
        labelName.font = UIFont(name: "Montserrat", size: 22)
        labelName.anchor(top: view.topAnchor, left: doctorImages.rightAnchor, right: view.rightAnchor,
                     paddingTop: 22, paddingLeft: 16)
        
        view.addSubview(labelSpec)
        labelSpec.numberOfLines = 0
        labelSpec.anchor(top: labelName.topAnchor, left: doctorImages.rightAnchor, right: view.rightAnchor, paddingTop: 22, paddingLeft: 16)
        
        
        let bellImages = UIImageView()
        bellImages.image = imageBell
        view.addSubview(bellImages)
        bellImages.anchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 22, paddingRight: 16, width: 28, height: 28)
        
        let viewTwo = UIView()
        viewTwo.backgroundColor = UIColor.white
        layer.borderWidth = 1.0
        viewTwo.setHeight(height: 30)
        viewTwo.layer.cornerRadius = 15
        
        let calendarImage = UIImageView()
        calendarImage.image = calendarImg
        viewTwo.addSubview(calendarImage)
        calendarImage.centerY(inView: viewTwo)
        calendarImage.anchor(left: viewTwo.leftAnchor, paddingLeft: 8, width: 20, height: 20)
        
        viewTwo.addSubview(labelDate)
        labelDate.centerY(inView: viewTwo)
        labelDate.anchor(left: calendarImage.rightAnchor, bottom: viewTwo.bottomAnchor,
                         right: viewTwo.rightAnchor,  paddingLeft: 8, paddingBottom: 8, paddingRight: 8)
        
        view.addSubview(viewTwo)
        viewTwo.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 8, paddingRight: 16)
        
        return view
    }
    
    // Rating View
    
    func ratingView(image: UIImage, label: UILabel) -> UIView {
        let view = UIView()
        view.backgroundColor = Color.cardView
        layer.borderWidth = 1.0
        view.setHeight(height: 18)
        view.layer.cornerRadius = 4
        
        let starImage = UIImageView()
        starImage.image = image
        starImage.contentMode = .scaleAspectFit
        view.addSubview(starImage)
        starImage.anchor(left: view.leftAnchor, paddingLeft: 4, width: 13, height: 13)
        
        view.addSubview(label)
        label.numberOfLines = 0
        label.font = UIFont(name: "Montserrat", size: 12)
        label.anchor(left: starImage.rightAnchor, right: view.rightAnchor, paddingLeft: 4)
        return view
    }
}
