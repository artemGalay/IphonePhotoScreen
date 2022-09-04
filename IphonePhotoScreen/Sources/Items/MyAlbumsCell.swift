//
//  MyAlbumsCollectionViewCell.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 4.09.22.
//

import UIKit

class MyAlbumsCollectionViewCell: UICollectionViewCell {

    static let identifier = "MyAlbumCell"

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        contentView.addSubview(mainStack)
        mainStack.addArrangedSubview(image)
        mainStack.addArrangedSubview(descriptionLabel)
        mainStack.addArrangedSubview(numberLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }
}




