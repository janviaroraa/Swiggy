//
//  FoodSectionFilterItems.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import UIKit

/// Food Section 4: Food Items
class FoodSectionFilterItems: FoodSectionDataSource {
    var itemDelegate: SectionItemsActionCellDelegate?
    var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var sectionNumber: Int?

    var cellReuseIdentifier: String {
        return "FoodSectionFilterItemsCell"
    }

    var headerTitle: String? {
        return ""
    }

    func numberOfItems() -> Int {
        return 1
    }

    func cellClass() -> AnyClass {
        return FoodSectionFilterItemsCell.self
    }

    func cellSize(for collectionView: UICollectionView, in collectionViewSize: CGSize) -> CGSize {
        return CGSize(width: collectionViewSize.width, height: 200)
    }

    func configureCell(_ cell: UICollectionViewCell, item: Int, at indexPath: IndexPath) {
        if let cell = cell as? FoodSectionFilterItemsCell {
            cell.delegate = itemDelegate
        }
    }

    func didSelectItem(at index: Int, cell: UICollectionViewCell?) {
        print("Selected banner item at index: \(index)")
    }
}

