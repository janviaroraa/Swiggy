//
//  FoodSectionFilterCell.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import UIKit

/// CollectionViewCell for (Food Section 3: Custom Filters)
class FoodSectionFilterCell: UICollectionViewCell {
    private var selectedIndices: Set<Int> = []

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.disableAutoresizing()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FoodFilterCell.self, forCellWithReuseIdentifier: FoodFilterCell.identifier)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews() {
        contentView.addSubview(collectionView)
    }

    func layoutConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension FoodSectionFilterCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodFilterCell.identifier, for: indexPath) as? FoodFilterCell else { return UICollectionViewCell() }

        switch indexPath.item {
        case 0:
            cell.configure(with: "Reorder")
        case 1:
            cell.configure(with: "Your Eatlists")
        case 2:
            cell.configure(with: "Favourites ❤️")
        default:
            break
        }

        let isSelected = selectedIndices.contains(indexPath.item)
        cell.updateAppearance(isSelected: isSelected)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let titles = ["Reorder", "Your Eatlists", "Favourites ❤️"]
        guard indexPath.item < titles.count else {
            fatalError("Unexpected index path item \(indexPath.item)")
        }

        let buttonTitle = titles[indexPath.item]
        let font = UIFont.systemFont(ofSize: 18)
        let textRect = (buttonTitle as NSString).boundingRect(
            with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: collectionView.frame.height),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil
        )

        let cellWidth = textRect.width + 20
        let cellHeight = collectionView.frame.height * 7 / 8

        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedIndices.contains(indexPath.item) {
            selectedIndices.remove(indexPath.item)
        } else {
            selectedIndices.insert(indexPath.item)
        }

        collectionView.reloadItems(at: [indexPath])
    }
}
