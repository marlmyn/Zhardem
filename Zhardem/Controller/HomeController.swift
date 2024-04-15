//
//  HomeController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 01.04.2024.
//

import UIKit

class HomeController: UIViewController {
    
    //MARK: - Properties
    
    private var doctorCollectionView = DoctorCollectionView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Find your desire health solution"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private lazy var googleMap: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "google-maps")
        button.setImage(image, for: .normal)
        button.setWidth(width: 56)
        return button
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = " Search doctor, drugs, articles..."
        searchBar.searchBarStyle = .minimal
        searchBar.layer.cornerRadius = 20
        searchBar.positionAdjustment(for: .search)
        return searchBar
    }()
    
    //Buy Medicine
    private lazy var categoryImageCardio: UIView = {
        let view = UIView().categoryView(image: Images.Category.pharmacy, label: categoryLabelCardio)
        return view
    }()
    
    private lazy var categoryLabelCardio: UILabel = {
        let label = UILabel()
        label.text = "Buy Medicine"
        return label
    }()
    
    //Doctors
    private lazy var categoryImageEpi: UIView = {
        let view = UIView().categoryView(image: Images.Category.doctors, label: categoryLabelEpi)
        return view
    }()
    
    private lazy var categoryLabelEpi: UILabel = {
        let label = UILabel()
        label.text = "    Doctors"
        return label
    }()
    
    //Set Reminder
    private lazy var categoryImageNeu: UIView = {
        let view = UIView().categoryView(image: Images.Category.calendar, label: categoryLabelNeu)
        return view
    }()
    
    private lazy var categoryLabelNeu: UILabel = {
        let label = UILabel()
        label.text = "Set Reminder"
        return label
    }()
    
    //Emergency
    private lazy var categoryImageVena: UIView = {
        let view = UIView().categoryView(image: Images.Category.ambulance, label: categoryLabelVena)
        return view
    }()
    
    private lazy var categoryLabelVena: UILabel = {
        let label = UILabel()
        label.text = "   Emergency"
        return label
    }()
    
    //Upcoming Schedule
    private lazy var upcomingSchedule: UIView = {
        let view = UIView().upcomingSchedule(imageDoctor: Images.UpcomingSchedule.doctor, imageBell: Images.UpcomingSchedule.bell, calendarImg: Images.UpcomingSchedule.calendar, label: scheduleLabel, labelText: scheduleDate)
        
        return view
    }()
    
    private lazy var scheduleLabel: UILabel = {
        let label = UILabel()
        label.text = "Dr. Maria Waston                     General Nurse, Almaty"
        return label
    }()
   
    private lazy var scheduleDate: UILabel = {
        let label = UILabel()
        label.text = "Tue, Feb 21, 08:00am-10:00pm"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    // Top Doctor & See all
    private lazy var doctorLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Doctor"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(Color.textColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    // Health article & See all
    private lazy var articleLabel: UILabel = {
        let label = UILabel()
        label.text = "Health article"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var seeArticleButton: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(Color.textColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addTarget()
        //view.backgroundColor = .systemCyan
    }
    
    // MARK: - Add Target
    func addTarget() {
        googleMap.addTarget(self, action: #selector(handleGoogleMap), for: .touchUpInside)
        seeAllButton.addTarget(self, action: #selector(handleTopDoctor), for: .touchUpInside)
    }
    
    //MARK: - Selectors
    @objc func handleGoogleMap() {
        let viewController = LocationController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func handleTopDoctor() {
        let viewController = DoctorListController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    //MARK: - Helpers
    func configureUI() {
        navigationController?.navigationBar.isHidden = false
        
        //MARK: StackViews
        let firstStack = UIStackView(arrangedSubviews: [titleLabel, googleMap])
        firstStack.axis = .horizontal
        firstStack.distribution = .fill
        firstStack.spacing = 16
        view.addSubview(firstStack)
        firstStack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 4, paddingLeft: 16, paddingRight: 22)
        
        let secondStack = UIStackView()
        secondStack.axis = .horizontal
        secondStack.distribution = .fill
        secondStack.addArrangedSubview(searchBar)
        view.addSubview(secondStack)
        secondStack.anchor(top: firstStack.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 20, paddingLeft: 16, paddingRight: 16)
        
    
        let categoryStack = UIStackView(arrangedSubviews: [categoryImageCardio, 
                                                           categoryImageEpi,
                                                          categoryImageNeu,
                                                          categoryImageVena])
        categoryStack.axis = .horizontal
        categoryStack.distribution = .fillEqually
        view.addSubview(categoryStack)
        categoryStack.anchor(top: secondStack.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        let scheduleStack = UIStackView()
        scheduleStack.axis = .horizontal
        scheduleStack.addArrangedSubview(upcomingSchedule)
        view.addSubview(scheduleStack)
        scheduleStack.anchor(top: categoryStack.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 20, paddingLeft: 16, paddingRight: 16)
        

        let labelStack = UIStackView(arrangedSubviews: [doctorLabel, seeAllButton])
        labelStack.axis = .horizontal
        labelStack.distribution = .fill
        labelStack.spacing = 16
        view.addSubview(labelStack)
        labelStack.anchor(top: scheduleStack.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        // Doctor Collection View
        view.addSubview(doctorCollectionView)
        doctorCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        doctorCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        doctorCollectionView.topAnchor.constraint(equalTo: labelStack.bottomAnchor).isActive = true
        doctorCollectionView.setHeight(height: 200)
        doctorCollectionView.set(cells: DoctorModel.fetchDoctor())

        let articleStack = UIStackView(arrangedSubviews: [articleLabel, seeArticleButton])
        articleStack.axis = .horizontal
        articleStack.distribution = .fill
        articleStack.spacing = 16
        view.addSubview(articleStack)
        articleStack.anchor(top: doctorCollectionView.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 4, paddingLeft: 16, paddingRight: 16)
        
    }
}
