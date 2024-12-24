//
//  FoodSectionHeaderCell.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import UIKit

/// CollectionViewCell for (Food Section 1: Custom Image View of an animated Swiggy agent)
class FoodSectionHeaderCell: UICollectionViewCell {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.disableAutoresizing()
        imageView.image = UIImage(named: "HeaderImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutConstraints()
        applyBottomCornerRadius()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        applyBottomCornerRadius()
    }

    func addViews() {
        contentView.backgroundColor = .white
        addSubview(imageView)
    }

    func layoutConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func applyBottomCornerRadius() {
        let cornerRadius: CGFloat = 30
        let path = UIBezierPath(
            roundedRect: imageView.bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        imageView.layer.mask = mask
    }
}
