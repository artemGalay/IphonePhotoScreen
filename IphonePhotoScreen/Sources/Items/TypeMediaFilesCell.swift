//
//  TypeMediaFilesCell.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 5.09.22.
//

import UIKit

class TypeMediaFilesCell: UICollectionViewCell {
    
    static let identifier = "TypeMediaFilesCell"
    
    var contents: AlbumsModel? {
        didSet {
            imageView.image = UIImage(systemName: contents?.image ?? "")
            descriptionLabel.text = contents?.description
            numberLabel.text = contents?.number
        }
    }

    // MARK: - UIElements
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageChevron: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(systemName: "chevron.right")
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGray4
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups
    
    private func setupHierarchy() {
        contentView.addSubview(separatorView)
        contentView.addSubview(mainStack)
        mainStack.addArrangedSubview(imageView)
        mainStack.addArrangedSubview(descriptionLabel)
        mainStack.addArrangedSubview(numberLabel)
        mainStack.addArrangedSubview(imageChevron)

    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            mainStack.heightAnchor.constraint(equalToConstant: 200),
            mainStack.widthAnchor.constraint(equalToConstant: 400),
            
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            numberLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            imageChevron.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),

            separatorView.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 8),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            separatorView.heightAnchor.constraint(equalToConstant: 0.8),
            separatorView.widthAnchor.constraint(equalToConstant: 500)
        ])
    }

    func separatorViewOff(hide: Bool) {
        separatorView.isHidden = hide
    }
}
