//
//  SoloBannerCell.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import UIKit

class SoloBannerCell: UICollectionViewCell {
    static let identifier = "SoloBannerCell"

    private lazy var bannerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.disableAutoresizing()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        return imageView
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
        contentView.addSubview(bannerImage)
    }

    func layoutConstraints() {
        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: topAnchor),
            bannerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configure(with imageName: String) {
        bannerImage.image = UIImage(named: imageName)
    }
}
