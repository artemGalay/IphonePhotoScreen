//
//  AlbumsViewController.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 3.09.22.
//

import UIKit

final class AlbumsViewController: UIViewController {

    // MARK: - UIElements
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(MyAlbumswCell.self,
                                forCellWithReuseIdentifier: MyAlbumswCell.identifier)
        collectionView.register(TypeMediaFilesCell.self,
                                forCellWithReuseIdentifier: TypeMediaFilesCell.identifier)
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderView.identifier)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
        setupNavigationBar()
    }

    // MARK: - Setups
    
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

    // MARK: - BarButtonMenu
    
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

    // MARK: - Layout
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { sectionIndex, _ in

            let size = CGFloat(0.97)
            
            func layoutSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {

                let layoutHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(size),
                                                              heightDimension: .fractionalWidth(0.12))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutHeaderSize,
                                                                                      elementKind: UICollectionView.elementKindSectionHeader,
                                                                                      alignment: .top)
                return layoutSectionHeader
            }

            func layoutSection(groupWidthDimension: CGFloat,
                               groupHeightDimension: CGFloat,
                               countGroup: Int,
                               scrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior) -> NSCollectionLayoutSection {

                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(size),
                                                      heightDimension: .fractionalHeight(size))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupWidthDimension),
                                                       heightDimension: .fractionalWidth(groupHeightDimension))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: countGroup)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 10, trailing: 12)
                layoutSection.orthogonalScrollingBehavior = scrollingBehavior
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader()]

                return layoutSection
            }

            switch sectionIndex {
            case 0:
                return layoutSection(groupWidthDimension: 0.475,
                                     groupHeightDimension: 1.2,
                                     countGroup: 2,
                                     scrollingBehavior: .paging)
//                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(size), heightDimension: .fractionalHeight(size))
//
//                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 0)
//
//                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.475), heightDimension: .fractionalWidth(1.2))
//
//                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
//
//                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 10, trailing: 12)
//                layoutSection.orthogonalScrollingBehavior = .paging
//                layoutSection.boundarySupplementaryItems = [layoutSectionHeader()]
//
//                return layoutSection
            case 1:
                return layoutSection(groupWidthDimension: 0.475,
                                     groupHeightDimension: 0.6,
                                     countGroup: 1,
                                     scrollingBehavior: .paging)
//                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(size), heightDimension: .fractionalHeight(size))
//
//                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 0)
//
//                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.475), heightDimension: .fractionalWidth(0.6))
//
//                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 1)
//
//                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 10, trailing: 12)
//                layoutSection.orthogonalScrollingBehavior = .paging
//                layoutSection.boundarySupplementaryItems = [layoutSectionHeader()]
//
//                return layoutSection
            case 2:
                return layoutSection(groupWidthDimension: 1,
                                     groupHeightDimension: 0.12,
                                     countGroup: 1,
                                     scrollingBehavior: .none)
//                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(size), heightDimension: .fractionalHeight(size))
//
//                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 0)
//
//                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.12))
//
//                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 1)
//
//                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
//                layoutSection.boundarySupplementaryItems = [layoutSectionHeader()]
//                return layoutSection
            default:
                return layoutSection(groupWidthDimension: 1,
                                     groupHeightDimension: 0.12,
                                     countGroup: 1,
                                     scrollingBehavior: .none)
//                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(size), heightDimension: .fractionalHeight(size))
//
//                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 0)
//
//                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.12))
//
//                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 1)
//
//                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
//                layoutSection.boundarySupplementaryItems = [layoutSectionHeader()]
//                return layoutSection
            }
        }
    }
}

// MARK: - Extension

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AlbumsModel.modelsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumsModel.modelsArray[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        func itemMyAlbumsCell() -> UICollectionViewCell {
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumswCell.identifier, for: indexPath) as? MyAlbumswCell
            item?.contents = AlbumsModel.modelsArray[indexPath.section][indexPath.item]
            return item ?? UICollectionViewCell()
        }
        
        func itemTypeMediaFilesCell() -> UICollectionViewCell {
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: TypeMediaFilesCell.identifier, for: indexPath) as? TypeMediaFilesCell
            item?.contents = AlbumsModel.modelsArray[indexPath.section][indexPath.item]
            let lastCell = indexPath.row == (AlbumsModel.modelsArray[indexPath.section].count - 1) ? true: false
            item?.separatorViewOff(hide: lastCell)
            return item ?? UICollectionViewCell()
        }
        
        switch indexPath.section {
        case 0:
            return itemMyAlbumsCell()
        case 1:
            return itemMyAlbumsCell()
        case 2:
            return itemTypeMediaFilesCell()
        default:
            return itemTypeMediaFilesCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        func jointHeader(leftHeader: String, rightHeader: String?) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: HeaderView.identifier,
                                                                         for: indexPath) as? HeaderView
            header?.leftHeader.text = leftHeader
            header?.rightHeaderButton.setTitle(rightHeader, for: .normal)
            return header ?? UICollectionReusableView()
        }
        
        switch indexPath.section {
        case 0:
            return jointHeader(leftHeader: "Мои альбомы",rightHeader: "Все")
        case 1:
            return jointHeader(leftHeader: "Люди и места",rightHeader: nil)
        case 2:
            return jointHeader(leftHeader: "Типы медиафайлов",rightHeader: nil)
        default:
            return jointHeader(leftHeader: "Другое",rightHeader: nil)
        }
    }
}
