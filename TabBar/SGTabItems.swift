//
//  SGTabItems.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import Foundation
import UIKit

// SGTabItems follows the `Open for Extension, Closed for Modification` principle by using an enum for centralized tab management.
enum SGTabItems: String, CaseIterable {
    case home
    case food
    case eatList
    case bolt
    case reorder

    /// Returns the corresponding title for each tab.
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .food:
            return "Food"
        case .eatList:
            return "EatList"
        case .bolt:
            return "Bolt"
        case .reorder:
            return "Reorder"
        }
    }

    /// Returns the corresponding tab image for each tab.
    private var imageName: String {
        switch self {
        case .home:
            return "arrow.left.circle"
        case .food:
            return "takeoutbag.and.cup.and.straw"
        case .eatList:
            return "bookmark"
        case .bolt:
            return "bolt"
        case .reorder:
            return "cart"
        }
    }

    /// Returns the corresponding tab image in it's selected form for each tab.
    private var selectedImageName: String {
        switch self {
        case .home:
            return "arrow.backward.circle.fill"
        case .food:
            return "takeoutbag.and.cup.and.straw.fill"
        case .eatList:
            return "bookmark.fill"
        case .bolt:
            return "bolt.fill"
        case .reorder:
            return "cart.fill"
        }
    }

    /// Configures and returns a `UITabBarItem` for each tab
    var tabBarItem: UITabBarItem {
        let tabTitle = self.title
        let normalImage = UIImage(systemName: self.imageName)
        let selectedImage = UIImage(systemName: self.selectedImageName)
        let item = UITabBarItem(
            title: tabTitle,
            image: normalImage,
            selectedImage: selectedImage
        )
        return item
    }
}
