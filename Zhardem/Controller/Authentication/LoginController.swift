//
//  LoginController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 11.03.2024.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - Properties
    private var viewModel = LoginViewModel()
    private var customAlert = AlertController()
    
    // MARK: Email Container
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: Images.Authentication.email, textField: emailTextField)
        view.setHeight(height: 56)
        return view
    }()
    
    // MARK: Password Container
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: Images.Authentication.password, textField: passwordTextField)
        view.setHeight(height: 56)
        return view
    }()
    
    // MARK: Email TextField
    private let emailTextField: UITextField = {
        return CustomTextFiels(placeholder: "Enter your email")
    }()
    
    // MARK: Password TextField
    private let passwordTextField: UITextField = {
        let tf = CustomTextFiels(placeholder: "Enter your password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.tintColor = Color.textColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setWidth(width: 120)
        return button
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let loginButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.title = "Login"
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
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
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNotificationObserver()
        configureUI()
        setupNavigationBar()
        addTarget()
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Add Target
    func addTarget() {
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(showResetPasswordVC), for: .touchUpInside)
        dontHaveAccountButton.addTarget(self, action: #selector(showRegistration), for: .touchUpInside)
        googleLoginButton.addTarget(self, action: #selector(handleGoogleLogin), for: .touchUpInside)
        appleLoginButton.addTarget(self, action: #selector(handleAppleLogin), for: .touchUpInside)
        facebookLoginButton.addTarget(self, action: #selector(handleFacebookLogin), for: .touchUpInside)
    }
    
    //MARK: - Selectors
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let modelLogin = LoginModel(email: email, password: password)
        APIManager.shareInstance.callingLoginAPI(login: modelLogin) { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let responseModel):
                        print("Login successful with userID: \(responseModel.userID)")
                        TokenManager.tokenInstance.saveToken(token: responseModel.accessToken)
                        
                        let mainVC = TabBarController.shareInstance()
                        self.navigationController?.pushViewController(mainVC, animated: true)
                        
                    case .failure(let error):
                        switch error {
                            case .custom(let message):
                                print("Login error: \(message)")
                        }
                }
            }
        }
        print("Debug: \(email), \(password)")
    }
    
    
    
    @objc func showResetPasswordVC() {
        let viewController = ResetPasswordController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showRegistration() {
        let viewController = RegistrationController()
        navigationController?.pushViewController(viewController, animated: true)
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
    
    @objc func textDidChange(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        updateForm()
    }
    
    //MARK: - Helpers
    func setupNavigationBar() {
        let backImage = UIImage(resource: .back)
        let backButtonItem = UIBarButtonItem(image: backImage,
                                             style: .plain,
                                             target: navigationController,
                                             action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = false
        self.title = "Login"
        
        //MARK: Stack
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        //MARK: Second Stack
        let stackSecond = UIStackView(arrangedSubviews: [errorLabel, forgotPasswordButton])
        stackSecond.axis = .horizontal
        stackSecond.spacing = 8
        view.addSubview(stackSecond)
        stackSecond.anchor(top: stack.bottomAnchor,
                           left: view.leftAnchor,
                           right: view.rightAnchor,
                           paddingTop: 12, paddingLeft: 16, paddingRight: 16)
        
        //MARK: Third Stack
        let stackThird = UIStackView(arrangedSubviews: [loginButton, dontHaveAccountButton,                                                   dividerView, googleLoginButton,                                                       appleLoginButton, facebookLoginButton])
        stackThird.axis = .vertical
        stackThird.spacing = 28
        view.addSubview(stackThird)
        stackThird.anchor(top: forgotPasswordButton.bottomAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingTop: 26, paddingLeft: 16, paddingRight: 16)
        
        
        //MARK: Social Stack
        let socialStack = UIStackView(arrangedSubviews: [googleLoginButton,                                                                      appleLoginButton,
                                                         facebookLoginButton])
        socialStack.axis = .vertical
        socialStack.spacing = 18
        view.addSubview(socialStack)
        socialStack.anchor(top: stackThird.bottomAnchor,
                           left: view.leftAnchor,
                           right: view.rightAnchor,
                           paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
    }
    
    func configureNotificationObserver() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

// MARK: - FormViewModel
extension LoginController: FormViewModel {
    func updateForm() {
        loginButton.isEnabled = viewModel.shouldEnableButton
    }
}
