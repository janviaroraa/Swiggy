//
//  FoodSectionBanner.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import UIKit

/// Food Section 2: "Swiggy Offers" promotional banner 
class FoodSectionBanner: FoodSectionDataSource {
    var itemDelegate: SectionItemsActionCellDelegate?
    var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var sectionNumber: Int?

    var cellReuseIdentifier: String {
        return "FoodSectionBannerCell"
    }

    var headerTitle: String? {
        return ""
    }

    func numberOfItems() -> Int {
        return 1
    }

    func cellClass() -> AnyClass {
        return FoodSectionBannerCell.self
    }

    func cellSize(for collectionView: UICollectionView, in collectionViewSize: CGSize) -> CGSize {
        return CGSize(width: collectionViewSize.width, height: 200)
    }

    func configureCell(_ cell: UICollectionViewCell, item: Int, at indexPath: IndexPath) { }

    func didSelectItem(at index: Int, cell: UICollectionViewCell?) {
        print("Selected banner item at index: \(index)")
    }
}
