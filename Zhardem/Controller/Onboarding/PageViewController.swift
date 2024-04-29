//
//  PageViewController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 29.02.2024.
//

import UIKit

class PageViewController: UIPageViewController {
    
    //MARK: - Properties
    var pages = [UIViewController]()
    
    //MARK: External controls
    let skipButton = UIButton()
    let nextButton = UIButton()
    let pageControl = UIPageControl()
    let initialPage = 0
    
    //MARK: Animations
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonBottomAnchor: NSLayoutConstraint?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.backgroundView
        navigationController?.navigationBar.isHidden = true
        
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
        
        let page1 = OnboardingViewController(imageName: Images.Onboarding.onboarding1,
                                             descriptionText: "Remote call of qualified medical specialists")
        let page2 = OnboardingViewController(imageName: Images.Onboarding.onboarding2,
                                             descriptionText: "Consult only with a doctor you trust")
        let page3 = OnboardingViewController(imageName: Images.Onboarding.onboarding3,
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
       // skipButton.addTarget(self, action: #selector(skipTapped(_:)), for: .primaryActionTriggered)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.layer.cornerRadius = 30.0
        nextButton.backgroundColor = Color.nextButton
        
        nextButton.setImage(UIImage(named: "arrowRight"), for: .normal)
       // nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .primaryActionTriggered)
        
        // В вашем методе setup или viewDidLoad
        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)

    }
    
    func layout() {
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        
        NSLayoutConstraint.activate([
            // Center pageControl horizontally in the view
          
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            
            // Position nextButton to the right and bottom within the safe area
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.widthAnchor.constraint(equalToConstant: 60),
            
            // Position skipButton to the top and trailing within the safe area
          //  skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            skipButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
        ])
        
        //MARK: for Animations
        skipButtonTopAnchor = skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        pageControlBottomAnchor = pageControl.leftAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leftAnchor, multiplier: 2)
      //  nextButtonBottomAnchor = nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
       

        skipButtonTopAnchor?.isActive = true
        pageControlBottomAnchor?.isActive = true
        nextButtonBottomAnchor?.isActive = true
        
        
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
        UIView.animate(withDuration: 0.3, animations: {
            self.pageControl.alpha = 0
            self.skipButton.alpha = 0
            self.nextButton.alpha = 0

            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.pageControl.removeFromSuperview()
            self.skipButton.removeFromSuperview()
            self.nextButton.removeFromSuperview()
        })
    }

    
    private func showControls() {
        pageControlBottomAnchor?.constant = 16
        skipButtonTopAnchor?.constant = 16
        nextButtonBottomAnchor?.constant = 16
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
        let nextPage = pageControl.currentPage + 1
           pageControl.currentPage = min(nextPage, pages.count - 1)
           goToSpecificPage(index: pageControl.currentPage, ofViewControllers: pages)
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

extension PageViewController {
    static func shareInstance() -> PageViewController  {
        return PageViewController()
    }
}
