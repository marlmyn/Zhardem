//
//  ResetPasswordController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 15.03.2024.
//

import UIKit

class ResetPasswordController: UIViewController {
    
    //MARK: - Properties
    
    private var viewModel = ResetPasswordViewModel()
    
    private let textTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Your Password?"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your email or your phone number, we will send you confirmation code"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = UIColor.systemGray
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let items = ["Email", "Phone"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor =  UIColor(red: 0.898, green: 0.906, blue: 0.922, alpha: 1.0)
        segmentedControl.selectedSegmentTintColor = UIColor.white
        segmentedControl.setHeight(height: 44)
        segmentedControl.layer.cornerRadius = 22
        return segmentedControl
    }()
    
    //MARK: Email Container
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: UIImage(named: "Email")!, textField: emailTextField)
        view.setHeight(height: 56)
        return view
    }()
    
    //MARK: Email TextField
    private let emailTextField: UITextField = {
        return CustomTextFiels(placeholder: "Enter your email")
    }()
    
    private let resetPassword: AuthButton = {
        let button = AuthButton(type: .system)
        button.title = "Reset Password"
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNotificationObserver()
        configureUI()
        setupNavigationBar()
        addTarget()
    }
    
    //MARK: - Selectors
    @objc func handleResetPassword() {
        print(" DEBUG: Handle Reset Password")
    }
    
    @objc func textDidChange(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }
        updateForm()
    }
    
    //Mark: - Add Target
    func addTarget() {
        resetPassword.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
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
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = UIColor(red: 0.9608, green: 0.9686, blue: 1.0, alpha: 1.0)
        
        //MARK:   Stack View
        let stack = UIStackView(arrangedSubviews: [textTitleLabel, subTitleLabel, segmentedControl])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 16, paddingRight: 16)
        
        
        let secondStack = UIStackView(arrangedSubviews: [emailContainerView, resetPassword])
        secondStack.axis = .vertical
        secondStack.distribution = .fillEqually
        secondStack.spacing = 24
        view.addSubview(secondStack)
        secondStack.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 16, paddingRight: 16)
    }
    
    func configureNotificationObserver() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}


// MARK: - FormViewModel
extension ResetPasswordController: FormViewModel {
    func updateForm() {
        resetPassword.isEnabled = viewModel.shouldEnableButton
    }
}
