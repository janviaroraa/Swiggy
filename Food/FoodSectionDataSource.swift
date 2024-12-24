//
//  FoodSectionDataSource.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import UIKit

/// Handles individual sections in the UICollectionView & it's sub-classes
/// A generic architecture is made so that it becomes easy to reuse components in future. In case of addition of new sections, the main viewController i.e. FoodViewController won't need to do much of the configuration. It will be handled by FoodSectionDataSource.
protocol FoodSectionDataSource: AnyObject {
    var itemDelegate: SectionItemsActionCellDelegate? { get set }

    var flowLayout: UICollectionViewFlowLayout { get set }
    var sectionNumber: Int? { get set }
    var cellReuseIdentifier: String { get }
    var headerTitle: String? { get }

    func cellClass() -> AnyClass

    func numberOfItems() -> Int
    func cellSize(for collectionView: UICollectionView, in collectionViewSize: CGSize) -> CGSize
    func configureCell(_ cell: UICollectionViewCell, item: Int, at indexPath: IndexPath)
    func didSelectItem(at index: Int, cell: UICollectionViewCell?)
}

protocol SectionItemsActionCellDelegate: AnyObject {
    func didSelectItem(_ item: FoodSectionFilterItemsDataModel)
    func didFetchData()
}
