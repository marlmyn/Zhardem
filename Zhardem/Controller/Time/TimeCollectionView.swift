//
//  TimeCollectionView.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 30.04.2024.
//

import UIKit

class TimeCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
       private let timeSlots = ["09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "07:00 PM", "08:00 PM"]
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
        register(TimeCollectionViewCell.self, forCellWithReuseIdentifier: TimeCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentInset = UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        
       
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeSlots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.reuseId, for: indexPath) as! TimeCollectionViewCell
        let time = timeSlots[indexPath.item]
        let isSelected = indexPath == selectedIndexPath
        cell.configure(with: time, isSelected: isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 40)
    }
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previouslySelectedIndexPath = selectedIndexPath
        selectedIndexPath = indexPath
        
        var indexPathsToReload: [IndexPath] = [indexPath]
        if let previous = previouslySelectedIndexPath, previous != indexPath {
            indexPathsToReload.append(previous)
        }
        
        collectionView.reloadItems(at: indexPathsToReload)
    }
    
}


