//
//  TabBarController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 08.04.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        //Create view controllers for each tab
        let firstViewController = HomeController()
        let secondViewController = MessageController()
        let thirdViewController = ScheduleController()
        let fourthViewController = ProfileController()
        
        //Set tab bar items and icons
        firstViewController.tabBarItem = UITabBarItem(title: "", image: .home, tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "", image: .message, tag: 1)
        thirdViewController.tabBarItem = UITabBarItem(title: "", image: .calendar, tag: 2)
        fourthViewController.tabBarItem = UITabBarItem(title: "", image: .profile, tag: 3)
        
        self.setViewControllers([firstViewController,
                                     secondViewController,
                                     thirdViewController,
                                     fourthViewController], animated: false)
       
        tabBar.tintColor = UIColor(red: 0.7255, green: 0.8627, blue: 0.9490, alpha: 1.0)
        tabBar.backgroundColor = .white
        
    }
}
