//
//  SGTabBarViewController.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import Foundation
import UIKit

// Configures tab bar for the Swiggy App
class SGTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }

    // Food tab is selected as the default tab on app launch.
    private func configureTabs() {
        viewControllers = navItems()
        tabBar.tintColor = .swiggyOrange
        tabBar.unselectedItemTintColor = .lightGray
        selectedIndex = SGTabItems.allCases.firstIndex(of: .food) ?? 0
    }

    /// Returns the array of corresponding view controller for each tab.
    private func getViewController(tabItem: SGTabItems) -> UIViewController {
        switch tabItem {
        case .home:
            return HomeViewController()
        case .food:
            return FoodViewController()
        case .eatList:
            return EatListViewController()
        case .bolt:
            return BoltViewController()
        case .reorder:
            return ReorderViewController()
        }
    }

    /// Wraps each associated view controller in a `UINavigationController`
    private func navItems() -> [UINavigationController] {
        var navItems = [UINavigationController]()

        SGTabItems.allCases.forEach { tabItem in
            let navController = UINavigationController(rootViewController: getViewController(tabItem: tabItem))
            navController.tabBarItem = tabItem.tabBarItem
            navItems.append(navController)
        }

        return navItems
    }
}
