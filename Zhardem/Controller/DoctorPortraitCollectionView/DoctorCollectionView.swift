//
//  DoctorCollectionView.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 13.04.2024.
//

import UIKit
import Alamofire
import Kingfisher

class DoctorCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var doctors = [DoctorModel]()
    weak var doctorDelegate: DoctorCollectionViewDelegate?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        setupCollectionView()
        fetchTopDoctors()
    }
    
    private func setupCollectionView() {
        delegate = self
        dataSource = self
        register(DoctorCollectionViewCell.self, forCellWithReuseIdentifier: DoctorCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    private func fetchTopDoctors() {
        if let accessToken = UserDefaults.standard.string(forKey: "AccessToken") {
            
            //TokenManager.tokenInstance.getToken()
            print(accessToken)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doctors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: DoctorCollectionViewCell.reuseId, for: indexPath) as! DoctorCollectionViewCell
        let doctor = doctors[indexPath.item]
        cell.fullNameLabel.text = doctor.fullName
        cell.specialLabel.text = doctor.specialization
        cell.rateLabel.text = String(doctor.rating)
        cell.distanceLabel.text = String(format: "%.2f km", doctor.distance)
        if let imageUrl = URL(string: doctor.imagePath) {
            cell.doctorImage.kf.setImage(with: imageUrl)
        } else {
            cell.doctorImage.image = UIImage(named: "defaultImage") // Fallback image
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: frame.height * 0.85)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedDoctor = doctors[indexPath.item]
        doctorDelegate?.didSelectDoctor(selectedDoctor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



