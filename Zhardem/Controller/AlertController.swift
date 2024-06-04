//
//  AlertController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 05.04.2024.
//

import UIKit

class AlertController: NSObject {
    
    struct Constants {
        static let backgroundAlphaTo: CGFloat = 0.6
    }
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private let alertView: UIView = {
        let alert = UIView()
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 24
        return alert
    }()
    
    private var mytargetView: UIView?
    
    func showAlert(with title: String,
                   messages: String,
                   buttonTitle: String,
                   on viewController: UIViewController,
                   completion: (() -> Void)? = nil) {
        
        guard let targetView = viewController.view else { return }
        
        mytargetView = targetView
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        targetView.addSubview(alertView)
        alertView.frame = CGRect(x: 30,
                                 y: -400,
                                 width: targetView.frame.size.width-60,
                                 height: 400)
        
        let image = UIImageView(frame: CGRect(x: 120, y: 40, width: 102, height: 102))
        image.image = UIImage(resource: .done)
        alertView.addSubview(image)
        
        let titleLabel = UILabel(frame: CGRect(x: 0,
                                               y: 140,
                                               width: alertView.frame.size.width,
                                               height: 80))
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        
    
        let messageLabel = UILabel(frame: CGRect(x: 0,
                                                 y: 210,
                                                 width: alertView.frame.size.width,
                                                 height: 50))
        messageLabel.numberOfLines = 0
        messageLabel.text = messages
        messageLabel.textAlignment = .center
        messageLabel.textColor = .systemGray2
        messageLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
        alertView.addSubview(messageLabel)
                
        let button = UIButton(frame: CGRect(x: 80, y: 290, width: 180, height: 56))
        button.setTitle(buttonTitle, for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = Color.authButton
        button.addTarget(self, action: #selector(dissmissAlert), for: .touchUpInside)
        alertView.addSubview(button)

        UIView.animate(withDuration: 0.25, animations: {
            self.backgroundView.alpha = Constants.backgroundAlphaTo
            self.alertView.frame = CGRect(x: 30,
                                          y: -400,
                                          width: targetView.frame.size.width-60,
                                          height: 400)
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25, animations: {
                    self.alertView.center = targetView.center
                })
            }
        })
    }
    
    @objc func dissmissAlert(showVC: UIViewController) {
        print("Dismiss alert button pressed")
        guard let targetView = mytargetView else { return }
      
        UIView.animate(withDuration: 0.25, animations: {
            self.alertView.frame = CGRect(x: 30,
                                          y: targetView.frame.size.height,
                                          width: targetView.frame.size.width-60,
                                          height: 400)
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25, animations: {
                    self.backgroundView.alpha = 0
                }, completion: { done in
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                    }
                })
            }
        })
    }
}
