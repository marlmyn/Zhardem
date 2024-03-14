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
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    private let loginButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(LoginController.self, action: #selector(handleLogin), for: .touchUpInside)
        button.setTitle("Login", for: .normal)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let buttonTwo = UIButton(type: .system)
        
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 16)]
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: atts)
        
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(red: 0, green: 0, blue: 0.5, alpha: 1), .font: UIFont.systemFont(ofSize: 16)]
        attributedTitle.append(NSMutableAttributedString(string: "Sign Up", attributes: boldAtts))
        
        buttonTwo.setAttributedTitle(attributedTitle, for: .normal)
        return buttonTwo
    }()
    
    private let dividerView = DividerView()
    
    private let googleLoginButton: SocialButton = {
        let button = SocialButton(image: UIImage(named: "google")!, title: " Sign in with Google")
        return button
    }()
    
    private let appleLoginButton: SocialButton = {
        let button = SocialButton(image: UIImage(named: "apple")!, title: " Sign in with Apple")
        return button
    }()
    
    private let facebookLoginButton: SocialButton = {
        let button = SocialButton(image: UIImage(named: "facebook")!, title: " Sign in with Facebook")
        return button
    }()
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        addTarget()
    }
    
    //MARK: - Add Target
    func addTarget() {
        forgotPasswordButton.addTarget(self, action: #selector(showForgotPassword), for: .touchUpInside)
        dontHaveAccountButton.addTarget(self, action: #selector(showDontHaveAccount), for: .touchUpInside)
        googleLoginButton.addTarget(self, action: #selector(handleGoogleLogin), for: .touchUpInside)
        appleLoginButton.addTarget(self, action: #selector(handleAppleLogin), for: .touchUpInside)
        facebookLoginButton.addTarget(self, action: #selector(handleFacebookLogin), for: .touchUpInside)
    }
    
    //MARK: - Selectors
    @objc func handleLogin() {
        print("DEBUG: Handle Login")
    }
    
    @objc func showForgotPassword() {
        print("DEBUG: Show Forgot Password")
    }
    
    @objc func showDontHaveAccount() {
        print("DEBUG: Don't Have an Account")
    }
    
    @objc func handleGoogleLogin() {
        print("DEBUG: Google Login")
    }
    @objc func handleAppleLogin() {
        print("DEBUG: Apple Login")
    }
    @objc func handleFacebookLogin() {
        print("DEBUG: Facebook Login")
    }
    
    //MARK: - Helpers
    func configureUI() {
        navigationController?.navigationBar.isHidden = false
        self.title = "Login"
        view.backgroundColor = UIColor(red: 0.9608, green: 0.9686, blue: 1.0, alpha: 1.0)
        
        //MARK: - Stack
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.anchor(top: stack.bottomAnchor, right: view.rightAnchor, paddingTop: 12, paddingRight: 16)
        
        //MARK: Second Stack
        let secondStack = UIStackView(arrangedSubviews: [loginButton, dontHaveAccountButton,                                                   dividerView, googleLoginButton,                                                       appleLoginButton, facebookLoginButton])
        secondStack.axis = .vertical
        secondStack.spacing = 28
        view.addSubview(secondStack)
        secondStack.anchor(top: forgotPasswordButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 26, paddingLeft: 16, paddingRight: 16)
        
        
        //MARK: Social Stack
        let socialStack = UIStackView(arrangedSubviews: [googleLoginButton,                                                                  appleLoginButton,
                                                     facebookLoginButton])
        socialStack.axis = .vertical
        socialStack.spacing = 18
        view.addSubview(socialStack)
        socialStack.anchor(top: secondStack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
       
    }
    
}
