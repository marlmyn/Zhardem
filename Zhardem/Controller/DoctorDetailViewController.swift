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
    
    private let doctorDetailView = DoctorCardView()
    private let dateCollectionView = DateCollectionView()
    private let timeCollectionView = TimeCollectionView()
    
    
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
    
    private lazy var bookingButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Book Appointment", for: .normal)
    button.backgroundColor = Color.authButton
    button.layer.cornerRadius = 22
    button.setTitleColor(.white, for: .normal)
        return button
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
        
    }
    
    
    // MARK: - Add Target
    func addTarget() {
        bookingButton.addTarget(self, action: #selector(handleBooking), for: .touchUpInside)
    }
    
    //MARK: - Selectors
    @objc func handleBooking() {
        
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
        
        doctorDetailView.setHeight(height: 125)
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
        
        view.addSubview(dateCollectionView)
        dateCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dateCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dateCollectionView.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 16).isActive = true
        dateCollectionView.setHeight(height: 100)
        
        view.addSubview(timeCollectionView)
        timeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            timeCollectionView.topAnchor.constraint(equalTo: dateCollectionView.bottomAnchor, constant: 20),
            timeCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        view.addSubview(bookingButton)
        view.addSubview(messageIcon)
        bookingButton.translatesAutoresizingMaskIntoConstraints = false
        messageIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
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


