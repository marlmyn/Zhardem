//
//  ArticlesCollectionView.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 29.04.2024.
//

import UIKit

class ArticlesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var articles = [ArticleModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        setupCollectionView()
        fetchArticles() 
    }
    
    private func setupCollectionView() {
        delegate = self
        dataSource = self
        register(ArticlesCollectionViewCell.self, forCellWithReuseIdentifier: ArticlesCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentInset = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    private func fetchArticles() {
        let accessToken = TokenManager.tokenInstance.getToken()
        
        APIManager.shareInstance.getArticleList(accessToken: accessToken) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let articleList):
                        self?.articles = articleList
                        self?.reloadData()
                    case .failure(let error):
                        print("Error fetching doctors: \(error)")
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ArticlesCollectionViewCell.reuseId, for: indexPath) as! ArticlesCollectionViewCell
        
        let article = articles[indexPath.item]
        cell.articleTitle.text = article.title
        cell.detailLabel.text = article.publicationDate
        
        if let imageUrl = URL(string: article.imagePath) {
            cell.articleImage.kf.setImage(with: imageUrl)
        } else {
            cell.articleImage.image = UIImage(named: "defaultImage") // Fallback image
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 356, height: 80)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


