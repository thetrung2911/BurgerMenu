//
//  MenuViewController.swift
//  SideMenuTest
//
//  Created by Trung Le on 9/6/20.
//  Copyright © 2020 Trung Le The. All rights reserved.
//

import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: SideMenuItem)
}

enum SideMenuItem: String, CaseIterable {
    case fucus = "FOCUS"
    case point = "TICH POINT"
    case addFriend = "YEU CAU DANG KY BAN BE"
    case extended = "GIA HAN"
    case block = "BLOCK"
    case notification = "THONG BAO"
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    public var delegate: MenuControllerDelegate?
    private var menuItems: [SideMenuItem] = []
    private let color = UIColor(red: 33/255.0,
    green: 33/255.0,
    blue: 33/255.0,
    alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.backgroundColor = color
        self.menuItems = SideMenuItem.allCases
        menuTableView.register(UITableViewCell.self,
        forCellReuseIdentifier: "cell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        menuTableView.rowHeight = UITableView.automaticDimension
        backButton.layer.cornerRadius = 5
        
        
    }
    
    
    @IBAction func onBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Relay to delegate about menu item selection
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
    
}
