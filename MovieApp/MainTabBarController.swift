//
//  MainTabBarController.swift
//  MovieApp
//
//  Created by Emir Alkal on 7.12.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configureViewControllers()
    }
    
    func configureAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        UITabBar.appearance().tintColor = .label
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().prefersLargeTitles = true
    }
    
    func configureViewControllers() {
        let nav1 = UINavigationController(rootViewController: SearchTableViewController())
        nav1.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        nav1.tabBarItem.title = "Search"
        
        viewControllers = [nav1]
    }
}
