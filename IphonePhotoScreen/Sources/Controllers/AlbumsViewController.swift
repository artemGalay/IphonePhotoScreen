//
//  AlbumsViewController.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 3.09.22.
//

import UIKit

class AlbumsViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyAlbumsCollectionViewCell.self, forCellWithReuseIdentifier: MyAlbumsCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
        setupNavigationBar()
    }

    func setupHierarchy() {

        view.addSubview(collectionView)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupNavigationBar() {

        let barButtonMenu = UIMenu(title: "", children: [
            UIAction(title: NSLocalizedString("Новый альбом", comment: ""),
                     image: UIImage(systemName: "rectangle.stack.badge.plus"),
                     handler: { _ in }),
            UIAction(title: NSLocalizedString("Новая папка", comment: ""),
                     image: UIImage(systemName: "folder.badge.plus"),
                     handler: { _ in }),
            UIAction(title: NSLocalizedString("Новый общий альбом", comment: ""),
                     image: UIImage(systemName: "rectangle.stack.badge.person.crop"),
                     handler: { _ in })])

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "",image: UIImage(systemName: "plus"), primaryAction: nil, menu: barButtonMenu)
    }

    func createLayout() -> UICollectionViewCompositionalLayout {

        return UICollectionViewCompositionalLayout { sectionIndex, _ in

            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(550))

                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                sectionLayout.orthogonalScrollingBehavior = .paging

                return sectionLayout
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.6))

                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                sectionLayout.orthogonalScrollingBehavior = .continuous

                return sectionLayout
            }
        }
    }
}

    extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return AlbumsModel.modelsArray.count
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return AlbumsModel.modelsArray[section].count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCollectionViewCell.identifier, for: indexPath) as? MyAlbumsCollectionViewCell
            item?.contents = AlbumsModel.modelsArray[indexPath.section][indexPath.item]
            return item ?? UICollectionViewCell()
        }
    }
