//
//  SeeArticlesController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 05.06.2024.
//

import UIKit

class SeeArticlesController: UIViewController {
    
    //MARK: - Properties
    private var popularArticlesCollectionView = PopularArticlesCollectionView()
    private var trendArticleCollectionView = TrendingArticlesCollectionView()
    private var relatedArticleCollectionView = RelatedArticlesCollectionView()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private lazy var contentSize: CGSize = {
        CGSize(width: view.frame.width, height: view.frame.height)
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = " Search articles, news..."
        searchBar.searchBarStyle = .minimal
        searchBar.layer.cornerRadius = 20
        searchBar.positionAdjustment(for: .search)
        return searchBar
    }()
    
    private lazy var popularArticlesLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Articles"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private lazy var trendArticlesLabel: UILabel = {
        let label = UILabel()
        label.text = "Trending Articles"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private lazy var relatedArticlesLabel: UILabel = {
        let label = UILabel()
        label.text = "Related Articles"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        configureUI()
        setupNavigationBar()
    }
    
    
    //MARK: - Helpers
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        self.title = "Articles"
        
        let backImage = UIImage(resource: .back)
        let backButtonItem = UIBarButtonItem(image: backImage,
                                             style: .plain,
                                             target: navigationController,
                                             action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
    
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Configure UI Constraint
    func configureUI() {
        //Constraint for ScrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        
        let searchStackView = UIStackView()
        searchStackView.axis = .horizontal
        searchStackView.distribution = .fill
        searchStackView.addArrangedSubview(searchBar)
        contentView.addSubview(searchStackView)
        searchStackView.anchor(top: contentView.safeAreaLayoutGuide.topAnchor,
                               left: contentView.leftAnchor,
                               right: contentView.rightAnchor,
                               paddingTop: 10, paddingLeft: 16, paddingRight: 16)
        
        contentView.addSubview(popularArticlesLabel)
        popularArticlesLabel.anchor(top: searchStackView.bottomAnchor,
                                    left: contentView.leftAnchor,
                                    right: contentView.rightAnchor,
                                    paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        // Popular Articles Collection View
        contentView.addSubview(popularArticlesCollectionView)
        popularArticlesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        popularArticlesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        popularArticlesCollectionView.topAnchor.constraint(equalTo: popularArticlesLabel.bottomAnchor).isActive = true
        popularArticlesCollectionView.setHeight(height: 120)
        
       // Trending Articles Collection View
        contentView.addSubview(trendArticlesLabel)
        trendArticlesLabel.anchor(top: popularArticlesCollectionView.bottomAnchor,
                                    left: contentView.leftAnchor,
                                    right: contentView.rightAnchor,
                                    paddingTop: 6, paddingLeft: 16, paddingRight: 16)
        
        contentView.addSubview(trendArticleCollectionView)
        trendArticleCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        trendArticleCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        trendArticleCollectionView.topAnchor.constraint(equalTo: trendArticlesLabel.bottomAnchor, constant: 12).isActive = true
        trendArticleCollectionView.setHeight(height: 200)
        
        // Related Articles Collection View/
        contentView.addSubview(relatedArticlesLabel)
        relatedArticlesLabel.anchor(top: trendArticleCollectionView.bottomAnchor,
                                    left: contentView.leftAnchor,
                                    right: contentView.rightAnchor,
                                    paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        contentView.addSubview(relatedArticleCollectionView)
        relatedArticleCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        relatedArticleCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        relatedArticleCollectionView.topAnchor.constraint(equalTo: relatedArticlesLabel.bottomAnchor, constant: 12).isActive = true
        relatedArticleCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        relatedArticleCollectionView.setHeight(height: 450)
        
    }
}
