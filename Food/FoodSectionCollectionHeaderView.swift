//
//  FoodSectionCollectionHeaderView.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import UIKit

/// Header view for individual section of FoodViewController.
/// It will only be set-up if we set any header title in FoodSectionDataSource. It header title is nil, it won;t be configured. It's logic is set-up in FoodViewController's `viewForSupplementaryElementOfKind` method.
class FoodSectionCollectionHeaderView: UICollectionReusableView {
    static let identifier = "FoodSectionCollectionHeaderView"

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with title: String) {
        titleLabel.text = title
    }
}
