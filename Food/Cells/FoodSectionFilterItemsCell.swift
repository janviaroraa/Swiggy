//
//  FoodSectionFilterItemsCell.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import UIKit

/// CollectionViewCell for (Food Section 4: Food Items)
class FoodSectionFilterItemsCell: UICollectionViewCell {

    weak var delegate: SectionItemsActionCellDelegate?
    var viewModel: FoodSectionFilterItemsViewModel?

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
        collectionView.register(FoodFilterItemsCell.self, forCellWithReuseIdentifier: FoodFilterItemsCell.identifier)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutConstraints()
        registerViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews() {
        contentView.addSubview(collectionView)
    }

    func registerViewModel() {
        viewModel = FoodSectionFilterItemsViewModel()
        viewModel?.delegate = self
        viewModel?.fetchData()
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

extension FoodSectionFilterItemsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.data.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodFilterItemsCell.identifier, for: indexPath) as? FoodFilterItemsCell else { return UICollectionViewCell() }
        if let viewModel {
            let itemData = viewModel.data[indexPath.row]
            cell.configure(item: itemData)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel else { return }
        delegate?.didSelectItem(viewModel.data[indexPath.row])
    }
}

extension FoodSectionFilterItemsCell: FoodSectionFilterItemsViewModelDelegate {
    func didFetchData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.delegate?.didFetchData()
        }
    }
}
