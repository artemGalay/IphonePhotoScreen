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
            image.image = UIImage(systemName: contents?.image ?? "")
            descriptionLabel.text = contents?.description
            numberLabel.text = contents?.number
        }
    }
    
    lazy var image: UIImageView = {
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
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
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
            
            image.widthAnchor.constraint(equalToConstant: 35),
            image.heightAnchor.constraint(equalToConstant: 35),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            
            numberLabel.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            
            imageChevron.centerYAnchor.constraint(equalTo: image.centerYAnchor),
        ])
    }
}
