//
//  FoodFilterCell.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import UIKit

class FoodFilterCell: UICollectionViewCell {
    static let identifier = "FoodFilterCell"

    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.disableAutoresizing()
        button.isUserInteractionEnabled = false
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.cornerRadius = 18
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.masksToBounds = true
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        button.backgroundColor = .systemBackground
        return button
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
        contentView.addSubview(filterButton)
    }

    func layoutConstraints() {
        NSLayoutConstraint.activate([
            filterButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filterButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with title: String) {
        filterButton.setTitle(title, for: .normal)
    }

    func updateAppearance(isSelected: Bool) {
        if isSelected {
            filterButton.backgroundColor = .black
            filterButton.setTitleColor(.white, for: .normal)
            filterButton.layer.borderColor = UIColor.black.cgColor
        } else {
            filterButton.backgroundColor = .white
            filterButton.setTitleColor(.black, for: .normal)
            filterButton.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}
