//
//  SGTabBarViewController.swift
//  Swiggy
//
//  Created by Janvi Arora on 06/12/24.
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
        viewControllers = SGTabItems.allCases.map { $0.navItem() }
        tabBar.tintColor = .swiggyOrange
        tabBar.unselectedItemTintColor = .lightGray
        selectedIndex = SGTabItems.allCases.firstIndex(of: .food) ?? 0
    }
}
