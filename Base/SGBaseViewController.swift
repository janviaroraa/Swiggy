//
//  SGBaseViewController.swift
//  Swiggy
//
//  Created by Janvi Arora on 06/12/24.
//

import UIKit

// SG refers to Swiggy here.
// It provide a common foundation for all view controllers in the Swiggy app. This helps us maintain clean architecture across app.
class SGBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        addViews()
        layoutConstraints()
        addTargets()
    }

    func addViews() { }

    func layoutConstraints() { }

    func configureNavigationBar() { }

    func addTargets() { }
}

