//
//  HeaderView.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 5.09.22.
//

import UIKit

class HeaderView: UICollectionReusableView {

    static let identifier = "HeaderView"

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var allButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(allButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),

            allButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            allButton.topAnchor.constraint(equalTo: self.topAnchor),
            allButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
