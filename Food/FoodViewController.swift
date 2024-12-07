//
//  FoodViewController.swift
//  Swiggy
//
//  Created by Janvi Arora on 06/12/24.
//

import Foundation
import UIKit

/// Designed to display food-related content
class FoodViewController: SGBaseViewController {

    /// Contains all sections that need to be displayed in Food Tab.
    private lazy var allSectionTypes: [FoodSectionDataSource] = [
        FoodSectionHeader(),
        FoodSectionBanner(),
        FoodSectionFilter(),
        FoodSectionFilterItems(),
        FoodSectionOnMind()
    ]

    private var viewModel: FoodViewModel?

    private lazy var containerView: UIView = {
        let view = UIView()
        view.disableAutoresizing()
        view.backgroundColor = .swiggyOrange
        return view
    }()

    private lazy var headerView: FoodHeaderView = {
        let view = FoodHeaderView()
        view.disableAutoresizing()
        view.delegate = self
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.disableAutoresizing()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .swiggyOrange
        collectionView.showsVerticalScrollIndicator = false
        for sectionType in self.allSectionTypes {
            collectionView.register(
                sectionType.cellClass(),
                forCellWithReuseIdentifier: sectionType.cellReuseIdentifier
            )
        }
        collectionView.register(
            FoodSectionCollectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: FoodSectionCollectionHeaderView.identifier
        )
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func registerViewModel() {
        viewModel = FoodViewModel()
    }

    override func addViews() {
        view.addSubviews(containerView, headerView, collectionView)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: headerView.topAnchor),

            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 120),

            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    /// Pull-to-Refresh
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }

    @objc
    private func handleRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self else { return }
            self.collectionView.refreshControl?.endRefreshing()
            self.collectionView.reloadData()
        }
    }
}

extension FoodViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return allSectionTypes.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allSectionTypes[section].numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = allSectionTypes[indexPath.section]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: section.cellReuseIdentifier, for: indexPath)
        section.itemDelegate = self
        section.configureCell(cell, item: indexPath.item, at: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = allSectionTypes[indexPath.section]
        return section.cellSize(for: collectionView, in: collectionView.bounds.size)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = allSectionTypes[indexPath.section]
        section.didSelectItem(at: indexPath.item, cell: collectionView.cellForItem(at: indexPath))
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView() }

        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: FoodSectionCollectionHeaderView.identifier,
            for: indexPath
        ) as? FoodSectionCollectionHeaderView else { return UICollectionReusableView() }

        let section = allSectionTypes[indexPath.section]
        if let headerTitle = section.headerTitle {
            header.configure(with: headerTitle)
        }

        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let sectionType = allSectionTypes[section]
        if let headerTitle = sectionType.headerTitle, !headerTitle.isEmpty {
            return CGSize(width: collectionView.frame.width, height: 50)
        }
        return .zero
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else { return }

        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let visibleHeight = scrollView.frame.height

        if offsetY <= 0 {
            collectionView.backgroundColor = .swiggyOrange
        } else if offsetY + visibleHeight >= contentHeight {
            collectionView.backgroundColor = .white
        }
    }
}

extension FoodViewController: SectionItemsActionCellDelegate {
    func didFetchData() {
        DispatchQueue.main.async {
            self.collectionView.refreshControl?.endRefreshing()
            self.collectionView.reloadData()
        }
    }
    
    func didSelectItem(_ item: FoodSectionFilterItemsDataModel) {
        DispatchQueue.main.async {
            let detailScreen = FoodDetailViewController(itemModel: item)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
}

extension FoodViewController: FoodHeaderViewDelegate {
    func didTapProfile() {
        DispatchQueue.main.async {
            let profileScreen = ProfileViewController()
            self.navigationController?.pushViewController(profileScreen, animated: true)
        }
    }
}
