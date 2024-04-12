//
//  MainViewController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 29.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var onboardPage = PageViewController()

    let stackView = UIStackView()
    let stackViewBtn = UIStackView()
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    //loginButton
    let loginButton = UIButton()
    let signUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
}

extension MainViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 14
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 26)
        nameLabel.textColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)
        nameLabel.text = "Zhardem"
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.text = "Let’s get started!"
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font = UIFont.systemFont(ofSize: 18)
        subTitleLabel.textAlignment = .center
        subTitleLabel.text = "Login to enjoy the features we’ve provided, and stay healthy!"
        subTitleLabel.numberOfLines = 0
        subTitleLabel.textColor = UIColor.systemGray
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.adjustsFontSizeToFitWidth = true
        loginButton.backgroundColor = UIColor(red: 0.7255, green: 0.8627, blue: 0.9490, alpha: 1.0)
        loginButton.layer.cornerRadius = 18
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.adjustsFontSizeToFitWidth = true
        signUpButton.backgroundColor = UIColor.white
        signUpButton.setTitleColor(.darkGray, for: .normal)
        signUpButton.layer.cornerRadius = 18
        signUpButton.addTarget(self, action: #selector(didTapSign), for: .touchUpInside)
    }
    
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(signUpButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            //stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            subTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 8),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subTitleLabel.trailingAnchor, multiplier: 8),
            
            loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            signUpButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            signUpButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            signUpButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
    
    //MARK: Selectors
    @objc func didTapLogin() {
        let vc = LoginController()
        self.navigationController?.pushViewController(vc, animated: true)
      }
    
    @objc func didTapSign() {
        let vc = RegistrationController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
