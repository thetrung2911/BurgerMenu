//
//  ViewController.swift
//  SideMenuTest
//
//  Created by Trung Le on 9/5/20.
//  Copyright © 2020 Trung Le The. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController, MenuControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?

    let menu = MenuController(with: SideMenuItem.allCases)

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        menu.delegate = self
        let storybroad = UIStoryboard(name: "Menu", bundle: nil)
        let vc = storybroad.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        vc.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: vc)
        sideMenu?.leftSide = true
        sideMenu?.pushStyle = .subMenu
        sideMenu?.presentationStyle = .menuSlideIn
        sideMenu?.menuWidth = view.frame.size.width / 2
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
//        SideMenuManager.default.menuAnimationBackgroundColor = .clear
        
    }
    
    func didSelectMenuItem(named: SideMenuItem) {
            title = named.rawValue
            switch named {
            case .fucus:
                print("focus")
            case .point:
                print("point")
            case .addFriend:
                let storybroad = UIStoryboard(name: "SubMenu", bundle: nil)
                let vc = storybroad.instantiateViewController(withIdentifier: "SubMenuViewController")
                sideMenu?.presentationStyle.backgroundColor = .clear
                sideMenu?.pushViewController(vc, animated: true)
            case .extended:
                print("point")
            case .block:
                print("point")
            case .notification:
                print("point")
            }

        }


}

