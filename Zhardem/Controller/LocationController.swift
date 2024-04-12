//
//  LocationController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 11.04.2024.
//

import UIKit

class LocationController: UIViewController {

    //MARK: - Properties
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        configureUI()
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
        self.title = "Find a doctor near you"
    }

}
