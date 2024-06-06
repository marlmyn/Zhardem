//
//  VerifyCodeViewController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 03.06.2024.
//

import UIKit
import Alamofire

class VerifyCodeViewController: UIViewController {
    
    // MARK: - Properties
    private let textTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter Verification Code"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the code that we have sent to your email"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = UIColor.systemGray
        return label
    }()
    
    private let codeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Verification Code"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.setHeight(height: 56)
        return textField
    }()
    
    private let verifyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Verify", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = Color.authButton
        button.setHeight(height: 56)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(verifyTapped), for: .touchUpInside)
        return button
    }()
    
    
    var userId: Int = UserDefaults.standard.integer(forKey: "UserId")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigationBar()
    }
    
    // MARK: - Setup Methods
    func setupNavigationBar() {
        let backImage = UIImage(systemName: "arrow.backward")
        let backButtonItem = UIBarButtonItem(image: backImage,
                                             style: .plain,
                                             target: self,
                                             action: #selector(popViewController))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
    
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        let stack = UIStackView(arrangedSubviews: [textTitleLabel, subTitleLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 16, paddingRight: 16)
        
        let stackView = UIStackView(arrangedSubviews: [codeTextField, verifyButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        stackView.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 16, paddingRight: 16)
    }
    
    // MARK: - Actions
    @objc func verifyTapped() {
        guard let enteredOTP = codeTextField.text, !enteredOTP.isEmpty else {
            showAlert(message: "Please enter a valid OTP.")
            return
        }
        
        print("Verifying OTP: \(enteredOTP)")
        verifyEmailOTP(enteredOTP: enteredOTP)
    }
    
    func verifyEmailOTP(enteredOTP: String) {
        APIManager.shareInstance.verifyEmailOTP(code: enteredOTP) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let otpResponse):
                    if let accessToken = otpResponse.accessToken, let refreshToken = otpResponse.refreshToken, let userId = otpResponse.userId {
                        UserDefaults.standard.set(accessToken, forKey: "AccessToken")
                        UserDefaults.standard.set(refreshToken, forKey: "RefreshToken")
                        UserDefaults.standard.set(userId, forKey: "UserId")
                        self.navigateToNextScreen()
                    } else {
                        self.showAlert(message: otpResponse.errorMessage ?? "Failed to verify OTP. Please try again.")
                    }
                case .failure(let error):
                    print("Error verifying OTP: \(error)")
                    self.showAlert(message: "Failed to verify OTP. Please try again.")
                }
            }
        }
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Verification Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true)
    }
    
    private func navigateToNextScreen() {
        let homeViewController = TabBarController()
        self.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
