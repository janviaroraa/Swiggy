//
//  EmptyView.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import UIKit

/// Custom Empty View for all the tabs that are not configured & were not a part of the assignment!
class EmptyView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.text = "Check Back Later!"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.disableAutoresizing()
        label.text = "Oops! It looks like there's nothing here right now. Please check back later for updates!"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        addViews()
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        addSubview(titleLabel)
        addSubview(descLabel)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            descLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            titleLabel.bottomAnchor.constraint(equalTo: descLabel.topAnchor, constant: -8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
