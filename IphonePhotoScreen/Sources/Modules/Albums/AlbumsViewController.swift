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

        collectionView.register(MyAlbumsCell.self,
                                forCellWithReuseIdentifier: MyAlbumsCell.identifier)
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
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
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
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { [unowned self] sectionIndex, _ in

            switch sectionIndex {
            case 0:
                return layoutSection(groupWidthDimension: 0.475,
                                     groupHeightDimension: 1.1,
                                     countGroup: 2,
                                     scrollingBehavior: .paging)
            case 1:
                return layoutSection(groupWidthDimension: 0.475,
                                     groupHeightDimension: 0.57,
                                     countGroup: 1,
                                     scrollingBehavior: .paging)
            case 2:
                return layoutSection(groupWidthDimension: 1,
                                     groupHeightDimension: 0.12,
                                     countGroup: 1,
                                     scrollingBehavior: .none)
            default:
                return layoutSection(groupWidthDimension: 1,
                                     groupHeightDimension: 0.12,
                                     countGroup: 1,
                                     scrollingBehavior: .none)
            }
        }
    }

    // MARK: - Funcs for header and layout

    private func layoutSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {

        let layoutHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.97),
                                                      heightDimension: .fractionalWidth(0.12))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutHeaderSize,
                                                                              elementKind: UICollectionView.elementKindSectionHeader,
                                                                              alignment: .top)
        return layoutSectionHeader
    }

    private func layoutSection(groupWidthDimension: CGFloat,
                               groupHeightDimension: CGFloat,
                               countGroup: Int,
                               scrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior) -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.97),
                                              heightDimension: .fractionalHeight(0.97))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupWidthDimension),
                                               heightDimension: .fractionalWidth(groupHeightDimension))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: countGroup)

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
        layoutSection.orthogonalScrollingBehavior = scrollingBehavior
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader()]

        return layoutSection
    }
}
