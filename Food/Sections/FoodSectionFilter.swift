//
//  FoodSectionFilter.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import UIKit

/// Food Section 3: Custom Filters
class FoodSectionFilter: FoodSectionDataSource {
    var itemDelegate: SectionItemsActionCellDelegate?
    var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var sectionNumber: Int?

    var cellReuseIdentifier: String {
        return "FoodSectionFilterCell"
    }

    var headerTitle: String? {
        return ""
    }

    func numberOfItems() -> Int {
        return 1
    }

    func cellClass() -> AnyClass {
        return FoodSectionFilterCell.self
    }

    func cellSize(for collectionView: UICollectionView, in collectionViewSize: CGSize) -> CGSize {
        return CGSize(width: collectionViewSize.width, height: 70)
    }

    func configureCell(_ cell: UICollectionViewCell, item: Int, at indexPath: IndexPath) { }

    func didSelectItem(at index: Int, cell: UICollectionViewCell?) {
        print("Selected banner item at index: \(index)")
    }
}

