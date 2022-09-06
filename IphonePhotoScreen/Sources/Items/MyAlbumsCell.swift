//
//  MyAlbumswCell.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 4.09.22.
//

import UIKit

class MyAlbumswCell: UICollectionViewCell {
    
    static let identifier = "MyAlbumCell"
    
    var contents: AlbumsModel? {
        didSet {
            image.image = UIImage(named: contents?.image ?? "")
            descriptionLabel.text = contents?.description
            numberLabel.text = contents?.number
        }
    }
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 5
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
            
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            mainStack.heightAnchor.constraint(equalToConstant: 600),
            mainStack.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
}
