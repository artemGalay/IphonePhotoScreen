//
//  HeaderView.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 5.09.22.
//

import UIKit

final class HeaderView: UICollectionReusableView {
    
    static let identifier = "HeaderView"

    // MARK: - UIElements
    
    lazy var leftHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rightHeaderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(separatorView)
        addSubview(leftHeader)
        addSubview(rightHeaderButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            separatorView.bottomAnchor.constraint(equalTo: leftHeader.topAnchor, constant: -15),
            separatorView.heightAnchor.constraint(equalToConstant: 0.8),
            separatorView.widthAnchor.constraint(equalToConstant: 420),

            leftHeader.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            leftHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            rightHeaderButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            rightHeaderButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    // MARK: - Configuration

    func configure(leftHeader: String, rightHeader: String?) {
        self.leftHeader.text = leftHeader
        self.rightHeaderButton.setTitle(rightHeader, for: .normal)
    }
}
