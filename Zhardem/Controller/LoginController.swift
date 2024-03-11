//
//  LoginController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 11.03.2024.
//

import UIKit

class LoginController: UIViewController {
    //MARK: - Properties
    //MARK: Email Container
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(named: "Email")!, textField: emailTextField)
        view.setHeight(height: 56)
        return view
    }()
    
    //MARK: Password Container
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(named: "Password")!, textField: passwordTextField)
        view.setHeight(height: 56)
        return view
    }()
    
    //MARK: Email TextField
    private let emailTextField: UITextField = {
       return CustomTextFiels(placeholder: "Enter your email")
    }()

    //MARK: Password TextField
    private let passwordTextField: UITextField = {
        let tf = CustomTextFiels(placeholder: "Enter your password")
        tf.isSecureTextEntry = true
        return tf
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       configureUI()
    }
    
    //MARK: - Selectors
    
    
    //MARK: - Helpers
    func configureUI() {
        navigationController?.navigationBar.isHidden = false
        self.title = "Login"
        view.backgroundColor = UIColor(red: 0.9608, green: 0.9686, blue: 1.0, alpha: 1.0)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
    }
    
}
