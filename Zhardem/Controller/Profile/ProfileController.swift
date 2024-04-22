//
//  ProfileController.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 08.04.2024.
//

import UIKit

class ProfileController: UIViewController {

    //MARK: - Properties
    
    var items: [String] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelection = false
        return tableView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.populateTableView()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    //MARK: - SetupUI
    private func setupUI() {
        self.view.addSubview(tableView)
        
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    private func populateTableView() {
        for number in  0...24 {
            self.items.append(number.description)
        }
    }
    
}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let title = self.items[indexPath.row]
        cell.textLabel?.text = title
        
        return cell
    }
    
    
}
