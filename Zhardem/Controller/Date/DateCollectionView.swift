//
//  DateCollectionView.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 30.04.2024.
//

import UIKit

class DateCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
   
        private let dates = [("Mon", "21"), ("Tue", "22"), ("Wed", "23"), ("Thu", "24"), ("Fri", "25"), ("Sat", "26")]
        private var selectedIndexPath: IndexPath?

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        setupCollectionView()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        delegate = self
        dataSource = self
        register(DateCollectionViewCell.self, forCellWithReuseIdentifier: DateCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentInset = UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dates.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCollectionViewCell.reuseId, for: indexPath) as! DateCollectionViewCell
            let date = dates[indexPath.row]
            let isSelected = indexPath == selectedIndexPath
            cell.configure(with: date.0, date: date.1, isSelected: isSelected)
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 68)
    }
        
        // MARK: - UICollectionViewDelegate
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            selectedIndexPath = indexPath
            collectionView.reloadData()
        }

}
