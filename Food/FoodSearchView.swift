//
//  FoodSearchView.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import UIKit

/// Custom search view. A reusable component that can be used throughout the app.
class FoodSearchView: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.disableAutoresizing()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 8
        stackView.layer.borderColor = UIColor.darkGray.cgColor
        return stackView
    }()

    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.disableAutoresizing()
        textField.placeholder = "Search for 'Biryani'"
        textField.delegate = self
        return textField
    }()

    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.disableAutoresizing()
        imageView.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .darkGray
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clearSearch))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()

    private lazy var verticalDividerView: UIView = {
        let view = UIView()
        view.disableAutoresizing()
        view.backgroundColor = .lightGray
        return view
    }()

    private lazy var talkbackImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.disableAutoresizing()
        imageView.image = UIImage(systemName: "mic.fill")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .swiggyOrange
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addViews()
        layoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(searchTextField)
        stackView.addArrangedSubview(searchImageView)
        stackView.addArrangedSubview(verticalDividerView)
        stackView.addArrangedSubview(talkbackImageView)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            searchImageView.widthAnchor.constraint(equalToConstant: 18),
            verticalDividerView.widthAnchor.constraint(equalToConstant: 1),
            talkbackImageView.widthAnchor.constraint(equalToConstant: 18)
        ])
    }

    @objc
    private func clearSearch() {
        searchTextField.text = ""
        searchImageView.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
    }
}

extension FoodSearchView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedText = getUpdatedText(text: textField.text, range: range, subText: string)

        let imageName = updatedText.isEmpty ? "magnifyingglass" : "xmark.circle.fill"
        searchImageView.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
        return true
    }

    private func getUpdatedText(text: String?, range: NSRange, subText: String) -> String{
        guard let _text = text else { return subText }

        if let textRange = Range(range, in: _text){
            return _text.replacingCharacters(in: textRange, with: subText)
        }
        return subText
    }
}
