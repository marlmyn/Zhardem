//
//  DoctorCollectionView.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 13.04.2024.
//

import UIKit

class DoctorCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [DoctorModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)

        delegate = self
        dataSource = self
        register(DoctorCollectionViewCell.self, forCellWithReuseIdentifier: DoctorCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 10
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    func set(cells: [DoctorModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: DoctorCollectionViewCell.reuseId, for: indexPath) as! DoctorCollectionViewCell
        cell.doctorImage.image = cells[indexPath.row].image
        cell.fullNameLabel.text = cells[indexPath.row].fullName
        cell.specialLabel.text = cells[indexPath.row].specialization
        cell.rateLabel.text = "\(cells[indexPath.row].rating)"
        cell.distanceLabel.text = "\(cells[indexPath.row].distance)m away"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: frame.height * 0.85)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



