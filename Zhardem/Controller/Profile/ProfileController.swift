//
//  ProfileController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 08.04.2024.
//

import UIKit

struct Sections {
    let title: String
    let options: [ProfileOptions]
}

struct ProfileOptions {
    let title: String
    let icon: UIImage?
    let handler: (() -> Void)
}

class ProfileController: UIViewController {

    //MARK: - Properties
    var models = [Sections]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorColor = .systemGray
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        return tableView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color.cardView
        self.setupUI()
        self.configure()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let tableViewHeader = TableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        self.tableView.tableHeaderView = tableViewHeader
        self.tableView.tableHeaderView?.backgroundColor = Color.authButton
        tableView.separatorColor = Color.authButton
        
    }
  
    //MARK: - SetupUI
    private func setupUI() {
        self.view.addSubview(tableView)
        
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func configure() {
        models.append(Sections(title: "", options: [
            ProfileOptions(title: "My Saved", icon: Images.Profile.icon1) {
                print("handle")
            },
            ProfileOptions(title: "Appointment", icon: Images.Profile.icon2) {
                
            },
            ProfileOptions(title: "Payment Method", icon: Images.Profile.icon3) {
                
            },
            ProfileOptions(title: "FAQs", icon: Images.Profile.icon4) {
                
            },
            ProfileOptions(title: "Logout", icon: Images.Profile.icon5) {
                APIManager.shareInstance.callingLogoutAPI(vc: self)
            }

            ])
        )
    }
}


//MARK: - Extensions
extension ProfileController: UITableViewDelegate, UITableViewDataSource {

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell (
            withIdentifier: ProfileTableViewCell.identifier,
            for: indexPath
        ) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
