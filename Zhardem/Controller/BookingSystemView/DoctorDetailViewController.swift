//
//  DoctorDetailViewController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 29.04.2024.
//

import UIKit

let doctorReuseId = "TopDoctorCollectionViewCell"

class DoctorDetailViewController: UIViewController {
    
    //MARK: - Properties
    var doctor: DoctorModel?
    private var customAlert = AlertController()
    
    private let doctorDetailView = DoctorCardView()
    private let dateCollectionView = DateCollectionView()
    private let timeCollectionView = TimeCollectionView()
    
    //
    func configureUIWithDoctorDetails(with doctor: DoctorModel) {
        doctorDetailView.fullNameLabel.text = doctor.fullName
        doctorDetailView.specialLabel.text = doctor.specialization
        doctorDetailView.rateLabel.text = "\(doctor.rating)"
        doctorDetailView.distanceLabel.text = "\(doctor.distance) m away"
        
        if let imageUrl = URL(string: doctor.imagePath) {
            doctorDetailView.doctorImage.kf.setImage(with: imageUrl)
        } else {
            doctorDetailView.doctorImage.image = UIImage(named: "defaultImage")
        }
    }
    
    
    //About Text
    private lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var aboutTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam..."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var readMoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Read more"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Review ⭐️⭐️⭐️⭐️⭐️"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var addReviewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(Color.textColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    private lazy var bookingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Book Appointment", for: .normal)
        button.backgroundColor = Color.authButton
        button.layer.cornerRadius = 22
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    //Injection
    private lazy var injectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Injection"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    private lazy var injectionPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$60.00"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    
    private lazy var dripLabel: UILabel = {
        let label = UILabel()
        label.text = "Drip"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    private lazy var dripPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$01.00"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$61.00"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = Color.authButton
        return label
    }()
    
    private lazy var paymentLabel: UILabel = {
        let label = UILabel()
        label.text = "Payment Method"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var messageIcon: UIButton = {
        let button = UIButton()
        let image = Images.Authentication.buttonChat
        button.setImage(image, for: .normal)
        //  button.setDimensions(height: 57, width: 57)
        return button
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupNavigationBar()
        if let doctor = doctor {
            configureUIWithDoctorDetails(with: doctor)
        }
        view.addSubview(timeCollectionView)
        addTarget()
    }
    
    
    // MARK: - Add Target
    func addTarget() {
        bookingButton.addTarget(self, action: #selector(handleBooking), for: .touchUpInside)
        addReviewButton.addTarget(self, action: #selector(handleReview), for: .touchUpInside)
    }
    
    //MARK: - Selectors
    @objc func handleBooking() {
        self.customAlert.showAlert(with: "Booking Success",
                                   messages: "Your booking has been successful!",
                                   buttonTitle: "Done",
                                   on: self) {
            print("Your payment has been successful! ")
        }
    }
    
    @objc func handleReview() {
        let viewController = ReviewViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: - Helpers
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        self.title = "Top Doctor"
        
        let backImage = UIImage(resource: .back)
        let backButtonItem = UIBarButtonItem(image: backImage,
                                             style: .plain,
                                             target: navigationController,
                                             action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
    
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func configure() {
        
        view.addSubview(doctorDetailView)
        
        doctorDetailView.setHeight(height: 126)
        doctorDetailView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                left: view.leftAnchor,
                                right: view.rightAnchor,
                                paddingTop: 10, paddingLeft: 16, paddingRight: 16)
        
        let stack = UIStackView(arrangedSubviews: [aboutLabel, aboutTextLabel])
        stack.axis = .vertical
        stack.spacing = 5
        view.addSubview(stack)
        stack.anchor(top: doctorDetailView.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        let reviewStack = UIStackView(arrangedSubviews: [reviewLabel, addReviewButton])
        reviewStack.axis = .horizontal
        reviewStack.spacing = 5
        view.addSubview(reviewStack)
        reviewStack.anchor(top: stack.bottomAnchor,
                           left: view.leftAnchor,
                           right: view.rightAnchor,
                           paddingTop: 12, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(dateCollectionView)
        dateCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dateCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dateCollectionView.topAnchor.constraint(equalTo: reviewStack.bottomAnchor, constant: 8).isActive = true
        dateCollectionView.setHeight(height: 100)
        
        view.addSubview(timeCollectionView)
        timeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            timeCollectionView.topAnchor.constraint(equalTo: dateCollectionView.bottomAnchor, constant: 12),
            timeCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        let priceInjStack = UIStackView(arrangedSubviews: [injectionLabel, injectionPriceLabel])
        priceInjStack.axis = .horizontal
        priceInjStack.spacing = 5
        view.addSubview(priceInjStack)
        priceInjStack.anchor(top: timeCollectionView.bottomAnchor,
                             left: view.leftAnchor,
                             right: view.rightAnchor,
                             paddingTop: 12, paddingLeft: 16, paddingRight: 16)
        
        let priceDripStack = UIStackView(arrangedSubviews: [dripLabel, dripPriceLabel])
        priceDripStack.axis = .horizontal
        priceDripStack.spacing = 5
        view.addSubview(priceDripStack)
        priceDripStack.anchor(top: priceInjStack.bottomAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: 6, paddingLeft: 16, paddingRight: 16)
        
        let totalPriceStack = UIStackView(arrangedSubviews: [totalLabel, totalPriceLabel])
        totalPriceStack.axis = .horizontal
        totalPriceStack.spacing = 5
        view.addSubview(totalPriceStack)
        totalPriceStack.anchor(top: priceDripStack.bottomAnchor,
                               left: view.leftAnchor,
                               right: view.rightAnchor,
                               paddingTop: 6, paddingLeft: 16, paddingRight: 16)
        
        
        view.addSubview(paymentLabel)
        paymentLabel.anchor(top: totalPriceStack.bottomAnchor,
                            left: view.leftAnchor,
                            right: view.rightAnchor,
                            paddingTop: 8, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(bookingButton)
        view.addSubview(messageIcon)
        bookingButton.translatesAutoresizingMaskIntoConstraints = false
        messageIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -6),
            bookingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bookingButton.heightAnchor.constraint(equalToConstant: 50),
            bookingButton.widthAnchor.constraint(equalToConstant: 266),
            
            messageIcon.centerYAnchor.constraint(equalTo: bookingButton.centerYAnchor),
            messageIcon.trailingAnchor.constraint(equalTo: bookingButton.leadingAnchor, constant: -12),
            messageIcon.widthAnchor.constraint(equalToConstant: 50),
            messageIcon.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        
        
    }
    
    
}


