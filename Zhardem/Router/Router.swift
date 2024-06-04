//
//  Router.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 08.04.2024.
//

import UIKit

final class Router {
    let navigation = UINavigationController()
 
    private func push(controller: UIViewController) {
        navigation.pushViewController(controller, animated: true)
    }
    
    private func pop() {
        navigation.popViewController(animated: true)
    }
    
     func setupNavigationBar() {
        let backImage = UIImage(resource: .back)
        let backButtonItem = UIBarButtonItem(image: backImage,
                                             style: .plain,
                                             target: navigation,
                                             action: #selector(navigation.popViewController(animated:)))
        navigation.navigationItem.leftBarButtonItem = backButtonItem
        navigation.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        
    }
     func pushHomeViewController() {
        let controller = HomeController()
        push(controller: controller)
    }
    
    func pushLoginViewController() {
        let controller = LoginController()
       push(controller: controller)
   }
    
}
