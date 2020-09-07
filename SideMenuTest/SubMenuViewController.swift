//
//  SubMenuViewController.swift
//  SideMenuTest
//
//  Created by Trung Le on 9/5/20.
//  Copyright © 2020 Trung Le The. All rights reserved.
//

import UIKit

class SubMenuViewController: UIViewController {
    
    private let color = UIColor(red: 33/255.0,
    green: 33/255.0,
    blue: 33/255.0,
    alpha: 1)
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var decisionButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.backgroundColor = color
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        backButton.layer.cornerRadius = 5
        decisionButton.layer.cornerRadius = 5
    }
    
    @IBAction func onBackAction(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func onDecisionAction(_ sender: Any) {
        print("onDecisionAction")
    }
    
    @IBAction func onCloseAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: false)
    }
}
