//
//  HeaderView.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 5.09.22.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    static let identifier = "HeaderView"
    
    lazy var leftHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rightHeaderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(lineView)
        addSubview(leftHeader)
        addSubview(rightHeaderButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: leftHeader.topAnchor, constant: -10),
            lineView.heightAnchor.constraint(equalToConstant: 0.8),
            lineView.widthAnchor.constraint(equalToConstant: 500),

            leftHeader.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            leftHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            rightHeaderButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            rightHeaderButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
