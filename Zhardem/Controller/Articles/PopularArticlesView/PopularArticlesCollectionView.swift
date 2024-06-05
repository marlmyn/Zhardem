//
//  PopularArticlesCollectionView.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 05.06.2024.
//

import UIKit

class PopularArticlesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var articles = [ArticleModel]()
   
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        setupCollectionView()
        fetchPopularArticles()
    }
    
    private func setupCollectionView() {
        delegate = self
        dataSource = self
        register(PopularArticlesCollectionViewCell.self, forCellWithReuseIdentifier: PopularArticlesCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }

    private func fetchPopularArticles() {
        if let accessToken = UserDefaults.standard.string(forKey: "AccessToken") {
            
            print(accessToken)
            APIManager.shareInstance.getArticleList(accessToken: accessToken) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let articlesList):
                        self?.articles = articlesList
                        self?.reloadData()
                    case .failure(let error):
                        print("Error fetching doctors: \(error)")
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: PopularArticlesCollectionViewCell.reuseId, for: indexPath) as! PopularArticlesCollectionViewCell
        let article = articles[indexPath.item]
        cell.nameLabel.text = article.tags
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: frame.height * 0.5)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
