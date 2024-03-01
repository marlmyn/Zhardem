//
//  PageViewController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 29.02.2024.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    
    //MARK: External controls
    let skipButton = UIButton()
    let nextButton = UIButton()
    let pageControl = UIPageControl()
    //let cardView = UIView()
    let initialPage = 0
    
    //MARK: Animations
    var pageControlLeftAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonRightAnchor: NSLayoutConstraint?
    var cardViewBottomAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor(red: 0.9608, green: 0.9686, blue: 1.0, alpha: 1.0)
        setup()
        style()
        layout()
    }

}
//MARK: Setup PageController
extension PageViewController {
    
    func setup() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        
        let page1 = OnboardingViewController(imageName: "onboarding1",
                                          descriptionText: "Remote call of qualified medical specialists")
        let page2 = OnboardingViewController(imageName: "onboarding2",
                                          descriptionText: "Consult only with a doctor you trust")
        let page3 = OnboardingViewController(imageName: "onboarding3",
                                          descriptionText: "Professional nurses for home injections and intravenous drips")
        let page4 = MainViewController()
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = UIColor.systemCyan
        pageControl.pageIndicatorTintColor = .gray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitleColor(.systemGray, for: .normal)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.addTarget(self, action: #selector(skipTapped(_:)), for: .primaryActionTriggered)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.layer.cornerRadius = 30.0
        nextButton.backgroundColor = UIColor(red: 0.7255, green: 0.8627, blue: 0.9490, alpha: 1.0)

        nextButton.setImage(UIImage(named: "arrowRight"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .primaryActionTriggered)
        
//        cardView.translatesAutoresizingMaskIntoConstraints = false
//        cardView.backgroundColor = UIColor(red: 0.9608, green: 0.9686, blue: 1.0, alpha: 1.0)
//        cardView.layer.cornerRadius = 24
                
    }
    
    func layout() {
//        view.addSubview(cardView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            // Constraints for pageControl
            pageControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            
            // Constraints for nextButton
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.widthAnchor.constraint(equalToConstant: 60),
            
            // Constraints for skipButton
            skipButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            skipButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0)
            
            // Constraints for cardView
//            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            cardView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
//            cardView.heightAnchor.constraint(equalToConstant: 280),
            
        ])
        
        //MARK: for Animations
        pageControlLeftAnchor = pageControl.leftAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leftAnchor, multiplier: 2)
        nextButtonRightAnchor = nextButton.rightAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.rightAnchor, multiplier: 2)
        skipButtonTopAnchor = skipButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
    
    }
    
}

//MARK: - DataSource
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last                  //wrap last
        } else {
            return pages[currentIndex - 1]    //go previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]   //go next
        } else {
            return pages.first               //wrap first
        }
    }
   
}

//MARK: - Delegate
extension PageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0])else { return }
        
        pageControl.currentPage = currentIndex
        animateControlsIfNeeded()
    }
    
    private func animateControlsIfNeeded() {
        let lastPage = pageControl.currentPage == pages.count - 1
        
        if lastPage {
            hideControls()
        } else {
            showControls()
        }
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func hideControls() {
        pageControlLeftAnchor?.constant = -80
        skipButtonTopAnchor?.constant = -80
        nextButtonRightAnchor?.constant = -80
        cardViewBottomAnchor?.constant = -80
    }
    
    private func showControls() {
        pageControlLeftAnchor?.constant = 16
        skipButtonTopAnchor?.constant = 16
        nextButtonRightAnchor?.constant = 16
        cardViewBottomAnchor?.constant = 16
    }
}

//MARK: - Actions
extension PageViewController {
    @objc func pageControlTapped(_ sender: UIPageControl){
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        animateControlsIfNeeded()
    }
    
    @objc func skipTapped(_ sender: UIButton) {
        let lastPage = pages.count - 1
        pageControl.currentPage = lastPage
        goToSpecificPage(index: lastPage, ofViewControllers: pages)
        animateControlsIfNeeded()
    }
    
    @objc func nextTapped(_ sender: UIButton) {
        pageControl.currentPage = pages.count + 1
        goToNextPage()
        animateControlsIfNeeded()
    }
}

//MARK: - Extension

extension UIPageViewController {
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let prevPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else { return }
        setViewControllers([prevPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}
