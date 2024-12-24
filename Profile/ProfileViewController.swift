//
//  ProfileViewController.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.disableAutoresizing()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .darkGray
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 50
        return imageView
    }()

    private lazy var tileLabel: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    private lazy var addressType: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        return label
    }()

    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavBar()
        addViews()
        layoutConstraints()
        setupUI()
    }

    private func addViews() {
        view.addSubview(avatarImageView)
        view.addSubview(tileLabel)
        view.addSubview(addressType)
        view.addSubview(addressLabel)
    }

    private func configureNavBar() {
        let backButtonImage = UIImage(systemName: "chevron.backward.circle.fill")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .systemOrange
        navigationItem.leftBarButtonItem = backButton
    }

    private func setupUI() {
        tileLabel.text = "Welcome back, Janvi!"

        if let savedAddressType = UserDefaults.standard.string(forKey: "selectedAddressType") {
            addressType.text = "Address Type: \(savedAddressType.capitalized)"
        } else {
            addressLabel.text = "Please choose the address type to get it reflected!"
        }

        if let savedAddress = UserDefaults.standard.string(forKey: "selectedAddress") {
            addressLabel.text = "Address: \(savedAddress)"
        } else {
            addressLabel.text = "Please choose the address from Main page to get it reflected!"
        }
    }

    private func layoutConstraints() {
        let padding: CGFloat = 16

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),

            tileLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding),
            tileLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            tileLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),

            addressType.topAnchor.constraint(equalTo: tileLabel.bottomAnchor, constant: padding),
            addressType.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            addressType.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),

            addressLabel.topAnchor.constraint(equalTo: addressType.bottomAnchor, constant: 4),
            addressLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            addressLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
        ])
    }

    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
