//
//  FoodFilterItemsCell.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import UIKit

class FoodFilterItemsCell: UICollectionViewCell {
    static let identifier = "FoodFilterItemsCell"

    private lazy var foodItemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.disableAutoresizing()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.image = UIImage(named: "banner1")
        return imageView
    }()

    private lazy var foodItemLabel: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    private lazy var foodCategoryLabel: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addViews()
        layoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews() {
        contentView.addSubviews(foodItemImage, foodItemLabel, foodCategoryLabel)
    }

    func layoutConstraints() {
        NSLayoutConstraint.activate([
            foodItemImage.topAnchor.constraint(equalTo: topAnchor),
            foodItemImage.widthAnchor.constraint(equalToConstant: 100),
            foodItemImage.heightAnchor.constraint(equalToConstant: 150),

            foodItemLabel.topAnchor.constraint(equalTo: foodItemImage.bottomAnchor, constant: 5),
            foodItemLabel.leadingAnchor.constraint(equalTo: foodItemImage.leadingAnchor),
            foodItemLabel.trailingAnchor.constraint(equalTo: foodItemImage.trailingAnchor),

            foodCategoryLabel.topAnchor.constraint(equalTo: foodItemLabel.bottomAnchor),
            foodCategoryLabel.leadingAnchor.constraint(equalTo: foodItemImage.leadingAnchor),
            foodCategoryLabel.trailingAnchor.constraint(equalTo: foodItemImage.trailingAnchor),
        ])
    }

    func configure(item: FoodSectionFilterItemsDataModel) {
        foodItemImage.image = UIImage(named: item.imageName)
        foodItemLabel.text = item.title
        foodCategoryLabel.text = item.category
    }
}
