//
//  HomeViewController.swift
//  Swiggy
//
//  Created by Janvi Arora on 06/12/24.
//

import Foundation
import UIKit

class HomeViewController: SGBaseViewController {

    let emptyView = EmptyView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func addViews() {
        view.addSubview(emptyView)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emptyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
