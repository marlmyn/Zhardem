//
//  EvaluateReviewViewController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 06.06.2024.
//

import UIKit

class EvaluateViewController: UIViewController {
    
    private var customAlert = AlertController()

    // Array to hold star buttons
    private var starButtons: [UIButton] = []
    private var selectedRating: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleSend))

        // Star Rating
        let starStackView = UIStackView()
        starStackView.axis = .horizontal
        starStackView.distribution = .fillEqually
        starStackView.spacing = 8
        starStackView.translatesAutoresizingMaskIntoConstraints = false

        for i in 1...5 {
            let starButton = UIButton()
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
            starButton.tag = i
            starButton.addTarget(self, action: #selector(starButtonTapped(_:)), for: .touchUpInside)
            starStackView.addArrangedSubview(starButton)
            starButtons.append(starButton)
        }

        view.addSubview(starStackView)
        
        // Review TextField
        let reviewTextField = UITextField()
        reviewTextField.placeholder = "Write a review..."
        reviewTextField.borderStyle = .none
        reviewTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reviewTextField)
        
        // Rate Label
        let rateLabel = UILabel()
        rateLabel.text = "Rate it and share your impressions"
        rateLabel.textColor = .lightGray
        rateLabel.font = UIFont.systemFont(ofSize: 16)
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rateLabel)

        // Constraints
        NSLayoutConstraint.activate([
            starStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            starStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            starStackView.heightAnchor.constraint(equalToConstant: 40),
            
            reviewTextField.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 16),
            reviewTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            reviewTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            reviewTextField.heightAnchor.constraint(equalToConstant: 40),
            
            rateLabel.topAnchor.constraint(equalTo: reviewTextField.bottomAnchor, constant: 16),
            rateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            rateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        self.title = "Evaluate"
        
        let backImage = UIImage(resource: .back)
        let backButtonItem = UIBarButtonItem(image: backImage,
                                             style: .plain,
                                             target: navigationController,
                                             action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
    
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }

    @objc func handleSend() {
        // Handle send action
        print("Review sent with rating: \(selectedRating) stars")
        self.customAlert.showAlert(with: "Thank you for your feedback!",
                                   messages: "Review sent with rating: \(selectedRating) stars",
                                   buttonTitle: "Done",
                                   on: self) {
            print("Your review has been successful! ")
        }
    }
    
    @objc func starButtonTapped(_ sender: UIButton) {
        selectedRating = sender.tag
        updateStarSelection()
    }
    
    
    private func updateStarSelection() {
        for (index, button) in starButtons.enumerated() {
            if index < selectedRating {
                button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            } else {
                button.setImage(UIImage(systemName: "star"), for: .normal)
            }
        }
    }
}
