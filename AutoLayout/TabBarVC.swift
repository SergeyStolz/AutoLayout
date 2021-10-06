//
//  TabBarVC.swift
//  AutoLayout
//
//  Created by mac on 02.10.2021.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(
                for: ProfileViewController(),
                   title: NSLocalizedString("Profile", comment: ""),
                   image: UIImage(systemName: "person")!),
            createNavController(
                for: ContactsViewController(),
                   title: NSLocalizedString("Contacts", comment: ""),
                   image: UIImage(systemName: "person.3.fill")!)
            
            
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navController
    }
}

