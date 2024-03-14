//
//  RegistrationController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 11.03.2024.
//

import UIKit

class RegistrationController: UIViewController {
    
    //MARK: - Properties
    private lazy var fullNameContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(named: "user")!, textField: fullNameTextField)
        view.setHeight(height: 56)
        return view
    }()
    
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
    private let fullNameTextField: UITextField = {
        return CustomTextFiels(placeholder: "Enter your name")
    }()
    
    private let emailTextField: UITextField = {
        return CustomTextFiels(placeholder: "Enter your email")
    }()
    
    //MARK: Password TextField
    private let passwordTextField: UITextField = {
        let tf = CustomTextFiels(placeholder: "Enter your password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let checkbox = CheckboxButton()
    
    private let privacyText: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "I agree to the Zhardem Terms of Service and Privacy Policy")
        attributedString.addAttribute(.link, value: "https://adilet.zan.kz/rus/docs/V2100024094", range: NSRange(location: 15, length: 14))
        label.textAlignment = .left
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let signUpButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(LoginController.self, action: #selector(handleSignUp), for: .touchUpInside)
        button.setTitle("Sign Up", for: .normal)
        return button
    }()
    
    
    private let alreadyHaveAccountButton: UIButton = {
        let buttonTwo = UIButton(type: .system)
        
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 16)]
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: atts)
        
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(red: 0, green: 0, blue: 0.5, alpha: 1), .font: UIFont.systemFont(ofSize: 16)]
        attributedTitle.append(NSMutableAttributedString(string: "Sign In", attributes: boldAtts))
        
        buttonTwo.setAttributedTitle(attributedTitle, for: .normal)
        return buttonTwo
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        configureUI()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox))
        checkbox.addGestureRecognizer(gesture)

    }
    
    //MARK: - Add Target
  
    
    //MARK: - Selectors
    @objc func didTapCheckbox() {
        checkbox.toggle()
    }
    
    @objc func handleSignUp() {
        print("DEBUG: Handle Sign UP")
    }
    
    
    //MARK: - Helpers
    func configureUI() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        self.title = "Sign Up"
        view.backgroundColor = UIColor(red: 0.9608, green: 0.9686, blue: 1.0, alpha: 1.0)
        
        
        //MARK:  - Stack View
        let stack = UIStackView(arrangedSubviews: [fullNameContainerView,
                                                   emailContainerView,                  passwordContainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
       
        
        let privacyStack = UIStackView(arrangedSubviews: [checkbox, privacyText])
        privacyStack.axis = .horizontal
        privacyStack.distribution = .fill
        privacyStack.spacing = 11
        view.addSubview(privacyStack)
        privacyStack.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 18, paddingRight: 18)
        
        
        let secondStack = UIStackView(arrangedSubviews: [signUpButton, alreadyHaveAccountButton])
        secondStack.axis = .vertical
        secondStack.spacing = 28
        view.addSubview(secondStack)
        secondStack.anchor(top: privacyStack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 26, paddingLeft: 16, paddingRight: 16)
    
        
    }
}

