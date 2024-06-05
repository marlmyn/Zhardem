//
//  RelatedArticlesCollectionView.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 06.06.2024.
//

import UIKit

class RelatedArticlesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var articles = [RelatedArticleModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        setupCollectionView()
        fetchRelatedArticles()
    }
    
    private func setupCollectionView() {
        delegate = self
        dataSource = self
        register(RelatedArticlesCollectionViewCell.self, forCellWithReuseIdentifier: RelatedArticlesCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentInset = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    private func fetchRelatedArticles() {
        if let accessToken = UserDefaults.standard.string(forKey: "AccessToken") {
            APIManager.shareInstance.getRelatedArticle(accessToken: accessToken) { [weak self] result in
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
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: RelatedArticlesCollectionViewCell.reuseId, for: indexPath) as! RelatedArticlesCollectionViewCell
        
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
