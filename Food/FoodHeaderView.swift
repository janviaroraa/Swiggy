//
//  FoodHeaderView.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import UIKit

protocol FoodHeaderViewDelegate: AnyObject {
    func didTapProfile()
}

/// Sticky header view. 
class FoodHeaderView: UIView {

    weak var delegate: FoodHeaderViewDelegate?
    var viewModel: FoodViewModel?

    private lazy var headerContainerView: UIView = {
        let view = UIImageView()
        view.disableAutoresizing()
        view.backgroundColor = .swiggyOrange
        view.isUserInteractionEnabled = true
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.disableAutoresizing()
        stack.axis = .vertical
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.disableAutoresizing()
        view.backgroundColor = .clear
        return view
    }()

    private lazy var addressButton: UIButton = {
        let button = UIButton()
        button.disableAutoresizing()
        button.setTitle("What's your address type?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.contentHorizontalAlignment = .left

        let leftImage = UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysTemplate)
        button.setImage(leftImage, for: .normal)
        button.tintColor = .white

        let rightImage = UIImage(systemName: "chevron.down")
        let rightImageView = UIImageView(image: rightImage)
        rightImageView.disableAutoresizing()
        rightImageView.tintColor = .white
        button.addSubview(rightImageView)

        let padding: CGFloat = 12
        let imageTitleSpacing: CGFloat = 8
        let trailingSpacing: CGFloat = 8

        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: padding + trailingSpacing)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: imageTitleSpacing, bottom: 0, right: trailingSpacing)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageTitleSpacing)

        NSLayoutConstraint.activate([
            rightImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            rightImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -4),
            rightImageView.widthAnchor.constraint(equalToConstant: 12),
            rightImageView.heightAnchor.constraint(equalToConstant: 16)
        ])

        button.addTarget(self, action: #selector(addressButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose a location"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.disableAutoresizing()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .darkGray
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 20
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()

    private lazy var searchBar = FoodSearchView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addViews()
        layoutConstraints()
        registerViewModel()
        updateUIWithSavedAddress()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        addSubview(headerContainerView)
        headerContainerView.addSubview(stackView)
        stackView.addArrangedSubview(containerView)
        containerView.addSubview(addressButton)
        stackView.addArrangedSubview(addressLabel)
        headerContainerView.addSubview(profileImageView)
        headerContainerView.addSubview(searchBar)
    }

    private func registerViewModel() {
        viewModel = FoodViewModel()
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: topAnchor),
            headerContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),

            stackView.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: searchBar.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: -10),

            addressButton.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 10),
            addressButton.topAnchor.constraint(equalTo: containerView.topAnchor),
            addressButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            profileImageView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -10),
            profileImageView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),

            addressLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            addressLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),

            searchBar.heightAnchor.constraint(equalToConstant: 50),
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }

    private func updateUIWithSavedAddress() {
        if let savedAddressType = UserDefaults.standard.string(forKey: "selectedAddressType"), let savedAddress = UserDefaults.standard.string(forKey: "selectedAddress") {
            addressButton.setTitle(savedAddressType.capitalized, for: .normal)
            addressLabel.text = savedAddress
        }
    }

    @objc
    private func addressButtonAction() {
        guard let viewModel else { return }

        let menuItems = viewModel.addressData.map { data in
            UIAction(title: data.type.rawValue.capitalized, handler: { [weak self] _ in
                UserDefaults.standard.set(data.type.rawValue, forKey: "selectedAddressType")
                UserDefaults.standard.set(data.address, forKey: "selectedAddress")
                self?.addressButton.setTitle(data.type.rawValue.capitalized, for: .normal)
                self?.addressLabel.text = data.address
            })
        }

        let menu = UIMenu(title: "Select Address Type", children: menuItems)
        addressButton.menu = menu
        addressButton.showsMenuAsPrimaryAction = true
    }

    @objc
    private func profileImageTapped() {
        delegate?.didTapProfile()
    }
}
