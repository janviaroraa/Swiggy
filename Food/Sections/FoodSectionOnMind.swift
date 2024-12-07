//
//  FoodSectionOnMind.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import UIKit

/// Food Section 4: Personalised Food Items
class FoodSectionOnMind: FoodSectionDataSource {
    var itemDelegate: SectionItemsActionCellDelegate?
    var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var sectionNumber: Int?

    var cellReuseIdentifier: String {
        return "FoodSectionOnMindCell"
    }

    var headerTitle: String? {
        let text = "Janvi, What's on your mind?"
        return text.capitalized
    }

    func numberOfItems() -> Int {
        return 1
    }

    func cellClass() -> AnyClass {
        return FoodSectionOnMindCell.self
    }

    func cellSize(for collectionView: UICollectionView, in collectionViewSize: CGSize) -> CGSize {
        return CGSize(width: collectionViewSize.width, height: 220)
    }

    func configureCell(_ cell: UICollectionViewCell, item: Int, at indexPath: IndexPath) {
        if let cell = cell as? FoodSectionOnMindCell {
            cell.delegate = itemDelegate
        }
    }

    func didSelectItem(at index: Int, cell: UICollectionViewCell?) {
        print("Selected banner item at index: \(index)")
    }
}


