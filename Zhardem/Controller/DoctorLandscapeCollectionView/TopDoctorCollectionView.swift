//
//  TopDoctorCollectionView.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 15.04.2024.
//

import UIKit
import Alamofire
import Kingfisher

class TopDoctorCollectionView: UICollectionView {
    
    var doctors = [DoctorModel]()
    weak var doctorDelegate: TopDoctorCollectionViewDelegate?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        fetchTopDoctors()
        setupCollectionView()
        
    }
    private func setupCollectionView() {
        delegate = self
        dataSource = self
        register(TopDoctorCollectionViewCell.self, forCellWithReuseIdentifier: TopDoctorCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fetchTopDoctors() {
        let accessToken = TokenManager.tokenInstance.getToken()
        
        APIManager.shareInstance.getDoctorList(accessToken: accessToken) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let doctorList):
                        self?.doctors = doctorList
                        self?.reloadData()
                    case .failure(let error):
                        print("Error fetching doctors: \(error)")
                }
            }
        }
    }
    
}

extension TopDoctorCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//           return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
//       }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doctors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: TopDoctorCollectionViewCell.reuseId, for: indexPath) as! TopDoctorCollectionViewCell
        let doctor = doctors[indexPath.item]
        cell.fullNameLabel.text = doctor.fullName
        cell.specialLabel.text = doctor.specialization
        cell.rateLabel.text = String(doctor.rating)
        cell.distanceLabel.text = String(format: "%.2f km", doctor.distance)
        if let imageUrl = URL(string: doctor.imagePath) {
            cell.doctorImage.kf.setImage(with: imageUrl)
        } else {
            cell.doctorImage.image = UIImage(named: "defaultImage") 
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedDoctor = doctors[indexPath.item]
        doctorDelegate?.didSelectDoctor(selectedDoctor)
    }
   
}

extension TopDoctorCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 334, height: 125)
    }
}
