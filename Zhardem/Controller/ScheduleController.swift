//
//  ScheduleController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 08.04.2024.
//

import UIKit

class ScheduleController: UIViewController {
    //MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Schedule"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private lazy var searchIcon: UIButton = {
        let button = UIButton()
        let image = Images.TabBar.bellIcon
        button.setImage(image, for: .normal)
        button.setWidth(width: 56)
        return button
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let items = ["Upcoming", "Completed", "Canceled"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = Color.whiteGray
        segmentedControl.selectedSegmentTintColor = Color.authButton
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.setHeight(height: 44)
        segmentedControl.layer.cornerRadius = 22
        return segmentedControl
    }()
  
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI() {
        navigationController?.navigationBar.isHidden = false
        
        //MARK: StackViews
        let firstStack = UIStackView(arrangedSubviews: [titleLabel, searchIcon])
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
        secondStack.addArrangedSubview(segmentedControl)
        view.addSubview(secondStack)
        secondStack.anchor(top: firstStack.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 28, paddingLeft: 16, paddingRight: 16)
        
    }
}
