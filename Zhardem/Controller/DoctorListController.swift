//
//  DoctorListController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 15.04.2024.
//

import UIKit

protocol TopDoctorCollectionViewDelegate: AnyObject {
    func didSelectDoctor(_ doctor: DoctorModel)
}

class DoctorListController: UIViewController, TopDoctorCollectionViewDelegate {
    //MARK: - Properties
    private var doctorCollectionView = TopDoctorCollectionView()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

       setupNavigationBar()
        configureUI()
        
        doctorCollectionView.doctorDelegate = self
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
    
    // Conforming to TopDoctorCollectionViewDelegate
       func didSelectDoctor(_ doctor: DoctorModel) {
           let detailViewController = DoctorDetailViewController()
           detailViewController.doctor = doctor
           navigationController?.pushViewController(detailViewController, animated: true)
       }
    
    func configureUI() {
       
        view.addSubview(doctorCollectionView)
        doctorCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        doctorCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        doctorCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        doctorCollectionView.setHeight(height: 850)
    }

}
