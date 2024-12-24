//
//  FoodDetailViewController.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import UIKit

/// Custom Detail screen for every food item.
class FoodDetailViewController: UIViewController {
    let itemModel: FoodSectionFilterItemsDataModel

    private lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.disableAutoresizing()
        imageView.image = UIImage(named: itemModel.imageName)
        return imageView
    }()

    private lazy var itemTileLabel: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.text = itemModel.title
        return label
    }()

    private lazy var itemCategoryLabel: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .left
        label.text = itemModel.category
        return label
    }()

    private lazy var itemDescLabel: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .justified
        label.text = itemModel.description
        label.numberOfLines = 0
        return label
    }()

    init(itemModel: FoodSectionFilterItemsDataModel) {
        self.itemModel = itemModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavBar()
        addViews()
        layoutConstraints()
    }

    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews() {
        view.addSubviews(itemImageView, itemTileLabel, itemCategoryLabel, itemDescLabel)
    }

    func configureNavBar() {
        let backButtonImage = UIImage(systemName: "chevron.backward.circle.fill")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .systemOrange
        navigationItem.leftBarButtonItem = backButton
    }

    func layoutConstraints() {
        let padding: CGFloat = 16

        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: view.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            itemImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),

            itemTileLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: padding),
            itemTileLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            itemTileLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),

            itemCategoryLabel.topAnchor.constraint(equalTo: itemTileLabel.bottomAnchor),
            itemCategoryLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            itemDescLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),

            itemDescLabel.topAnchor.constraint(equalTo: itemCategoryLabel.bottomAnchor, constant: padding),
            itemDescLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            itemDescLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
        ])
    }

    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
