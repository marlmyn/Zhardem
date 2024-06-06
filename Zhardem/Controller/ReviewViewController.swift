//
//  ReviewViewController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 06.06.2024.
//

import UIKit

class ReviewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = "Evaluate the work of the doctor"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Star Rating
        let starStackView = UIStackView()
        starStackView.axis = .horizontal
        starStackView.distribution = .fillEqually
        starStackView.spacing = 8
        starStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0..<5 {
            let starButton = UIButton()
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
            starStackView.addArrangedSubview(starButton)
        }
        
        view.addSubview(starStackView)
        
        // Write Review Button
        let writeReviewButton = UIButton(type: .system)
        writeReviewButton.setTitle("Write a review", for: .normal)
        writeReviewButton.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
        writeReviewButton.layer.cornerRadius = 8
        writeReviewButton.translatesAutoresizingMaskIntoConstraints = false
        writeReviewButton.addTarget(self, action: #selector(handleEvaluate), for: .touchUpInside)
        view.addSubview(writeReviewButton)
        
        // All Reviews Label
        let allReviewsLabel = UILabel()
        allReviewsLabel.text = "All reviews"
        allReviewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        allReviewsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(allReviewsLabel)
        
        // Reviews TextView
        let reviewsTextView = UITextView()
        reviewsTextView.isEditable = false
        reviewsTextView.text = """
        Aisulu ⭐️⭐️⭐️⭐️⭐️
        "Thanks to Zhardem, I was able to get the necessary procedure without stress and a long wait at the clinic. The nurse was very attentive and professional."
        
        Madina ⭐️⭐️⭐️⭐️⭐️
        Using Zhardem has been a real salvation for me. I work from home, and now I don't need to be distracted by trips to the clinic for routine procedures. The nurse arrived exactly at the appointed time, was very friendly and attentive. Thank you for your service!
        """
        reviewsTextView.font = UIFont.systemFont(ofSize: 14)
        reviewsTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reviewsTextView)
        
        // Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            starStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            starStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            starStackView.heightAnchor.constraint(equalToConstant: 40),
            
            writeReviewButton.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 16),
            writeReviewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            writeReviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            writeReviewButton.heightAnchor.constraint(equalToConstant: 44),
            
            allReviewsLabel.topAnchor.constraint(equalTo: writeReviewButton.bottomAnchor, constant: 16),
            allReviewsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            allReviewsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            reviewsTextView.topAnchor.constraint(equalTo: allReviewsLabel.bottomAnchor, constant: 8),
            reviewsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            reviewsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            reviewsTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
        
       
        
        
    }
    
    //MARK: - Helpers
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        self.title = "Review"
        
        let backImage = UIImage(resource: .back)
        let backButtonItem = UIBarButtonItem(image: backImage,
                                             style: .plain,
                                             target: navigationController,
                                             action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
    
    @objc func handleEvaluate() {
        let viewController = EvaluateViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}
