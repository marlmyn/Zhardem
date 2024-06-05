//
//  HomeController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 01.04.2024.
//

import UIKit

protocol DoctorCollectionViewDelegate: AnyObject {
    func didSelectDoctor(_ doctor: DoctorModel)
}

class HomeController: UIViewController {
    
    //MARK: - Properties
    
    private var doctorCollectionView = DoctorCollectionView()
    private var articleCollectionView = ArticlesCollectionView()
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private lazy var contentSize: CGSize = {
        CGSize(width: view.frame.width, height: view.frame.height)
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Find your desire health solution"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private lazy var googleMap: UIButton = {
        let button = UIButton()
        let image = Images.TabBar.map
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
    private lazy var categoryImagePharmacy: UIView = {
        let view = UIView().categoryView(image: Images.Category.pharmacy, label: categoryLabelPharmacy)
        return view
    }()
    
    private lazy var categoryLabelPharmacy: UILabel = {
        let label = UILabel()
        label.text = "    Pharmacy"
        return label
    }()
    
    //Doctors
    private lazy var categoryImageDoctor: UIView = {
        let view = UIView().categoryView(image: Images.Category.doctors, label: categoryLabelDoctor)
        return view
    }()
    
    private lazy var categoryLabelDoctor: UILabel = {
        let label = UILabel()
        label.text = "    Doctors"
        return label
    }()
    
    //Set Reminder
    private lazy var categoryImageDeadline: UIView = {
        let view = UIView().categoryView(image: Images.Category.calendar, label: categoryLabelDeadline)
        return view
    }()
    
    private lazy var categoryLabelDeadline: UILabel = {
        let label = UILabel()
        label.text = "Set Reminder"
        return label
    }()
    
    //Emergency
    private lazy var categoryImageEmergency: UIView = {
        let view = UIView().categoryView(image: Images.Category.ambulance, label: categoryLabelEmergency)
        return view
    }()
    
    private lazy var categoryLabelEmergency: UILabel = {
        let label = UILabel()
        label.text = "   Emergency"
        return label
    }()
    
    //Upcoming Schedule
    private lazy var upcomingSchedule: UIView = {
        let view = UIView().upcomingSchedule(imageDoctor: Images.UpcomingSchedule.doctor, imageBell: Images.UpcomingSchedule.bell, calendarImg: Images.UpcomingSchedule.calendar, labelName: scheduleName, labelSpec: scheduleSpec, labelDate: scheduleDate)
        
        return view
    }()
    
    private lazy var scheduleName: UILabel = {
        let label = UILabel()
        label.text = "Dr. Maria Waston"
        return label
    }()
    
    private lazy var scheduleSpec: UILabel = {
        let label = UILabel()
        label.text = "General Nurse, Almaty"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        configureUI()
        addTarget()
        self.hideKeyboardWhenTappedAround()
        doctorCollectionView.doctorDelegate = self
    }
    
    
    // MARK: - Add Target
    func addTarget() {
        googleMap.addTarget(self, action: #selector(handleGoogleMap), for: .touchUpInside)
        seeAllButton.addTarget(self, action: #selector(handleTopDoctor), for: .touchUpInside)
        seeArticleButton.addTarget(self, action: #selector(handleArticles), for: .touchUpInside)
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
    
    @objc func handleArticles() {
        let viewController = SeeArticlesController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        
        //MARK: StackViews
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        
        
        let firstStack = UIStackView(arrangedSubviews: [titleLabel, googleMap])
        firstStack.axis = .horizontal
        firstStack.distribution = .fill
        firstStack.spacing = 16
        contentView.addSubview(firstStack)
        firstStack.anchor(top: contentView.safeAreaLayoutGuide.topAnchor,
                          left: contentView.leftAnchor,
                          right: contentView.rightAnchor,
                          paddingTop: 4, paddingLeft: 16, paddingRight: 22)
        
        let secondStack = UIStackView()
        secondStack.axis = .horizontal
        secondStack.distribution = .fill
        secondStack.addArrangedSubview(searchBar)
        contentView.addSubview(secondStack)
        secondStack.anchor(top: firstStack.bottomAnchor,
                           left: contentView.leftAnchor,
                           right: contentView.rightAnchor,
                           paddingTop: 20, paddingLeft: 16, paddingRight: 16)
        
        
        let categoryStack = UIStackView(arrangedSubviews: [categoryImagePharmacy,
                                                           categoryImageDoctor,
                                                           categoryImageDeadline,
                                                           categoryImageEmergency])
        categoryStack.axis = .horizontal
        categoryStack.distribution = .fillEqually
        contentView.addSubview(categoryStack)
        categoryStack.anchor(top: secondStack.bottomAnchor,
                             left: contentView.leftAnchor,
                             right: contentView.rightAnchor,
                             paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        let scheduleStack = UIStackView()
        scheduleStack.axis = .horizontal
        scheduleStack.addArrangedSubview(upcomingSchedule)
        contentView.addSubview(scheduleStack)
        scheduleStack.anchor(top: categoryStack.bottomAnchor,
                             left: contentView.leftAnchor,
                             right: contentView.rightAnchor,
                             paddingTop: 20, paddingLeft: 16, paddingRight: 16)
        
        
        let labelStack = UIStackView(arrangedSubviews: [doctorLabel, seeAllButton])
        labelStack.axis = .horizontal
        labelStack.distribution = .fill
        labelStack.spacing = 16
        contentView.addSubview(labelStack)
        labelStack.anchor(top: scheduleStack.bottomAnchor,
                          left: contentView.leftAnchor,
                          right: contentView.rightAnchor,
                          paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        // Doctor Collection View
        contentView.addSubview(doctorCollectionView)
        doctorCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        doctorCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        doctorCollectionView.topAnchor.constraint(equalTo: labelStack.bottomAnchor).isActive = true
        doctorCollectionView.setHeight(height: 200)
        
        
        let articleStack = UIStackView(arrangedSubviews: [articleLabel, seeArticleButton])
        articleStack.axis = .horizontal
        articleStack.distribution = .fill
        articleStack.spacing = 16
        contentView.addSubview(articleStack)
        articleStack.anchor(top: doctorCollectionView.bottomAnchor,
                            left: contentView.leftAnchor,
                            right: contentView.rightAnchor,
                            paddingTop: 4, paddingLeft: 16, paddingRight: 16)
        
        articleStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(articleCollectionView)
        articleCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        articleCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        articleCollectionView.topAnchor.constraint(equalTo: articleStack.bottomAnchor).isActive = true
        articleCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        articleCollectionView.setHeight(height: 450)
        
    }
}


// MARK: -  Conforming to TopDoctorCollectionViewDelegate
extension HomeController: DoctorCollectionViewDelegate {
       func didSelectDoctor(_ doctor: DoctorModel) {
          // print("here are doctors \(doctor)")
           let detailViewController = DoctorDetailViewController()
           detailViewController.doctor = doctor
           navigationController?.pushViewController(detailViewController, animated: true)
           navigationController?.navigationBar.isHidden = true
       }
}
