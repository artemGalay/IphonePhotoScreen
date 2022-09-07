//
//  AlbumsViewController + Extensions.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 7.09.22.
//

import UIKit

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AlbumsModel.modelsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumsModel.modelsArray[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            return itemMyAlbumsCell(collectionView: collectionView, indexPath: indexPath)
        case 1:
            return itemMyAlbumsCell(collectionView: collectionView, indexPath: indexPath)
        case 2:
            return itemTypeMediaFilesCell(collectionView: collectionView, indexPath: indexPath)
        default:
            return itemTypeMediaFilesCell(collectionView: collectionView, indexPath: indexPath)
        }
    }

    // MARK: - Funcs for items

    func itemMyAlbumsCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCell.identifier, for: indexPath) as? MyAlbumsCell
        item?.configuration(model: AlbumsModel.modelsArray[indexPath.section][indexPath.item])
        return item ?? UICollectionViewCell()
    }

    func itemTypeMediaFilesCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: TypeMediaFilesCell.identifier, for: indexPath) as? TypeMediaFilesCell
        item?.configuration(model: AlbumsModel.modelsArray[indexPath.section][indexPath.item])

        let lastCell = indexPath.row == (AlbumsModel.modelsArray[indexPath.section].count - 1) ? true: false
        item?.separatorViewOff(hide: lastCell)
        return item ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch indexPath.section {
        case 0:
            return jointHeader(leftHeader: "Мои альбомы", rightHeader: "Все", collectionView: collectionView, kind: kind, indexPath: indexPath)
        case 1:
            return jointHeader(leftHeader: "Люди и места", rightHeader: nil, collectionView: collectionView, kind: kind, indexPath: indexPath)
        case 2:
            return jointHeader(leftHeader: "Типы медиафайлов", rightHeader: nil, collectionView: collectionView, kind: kind, indexPath: indexPath)
        default:
            return jointHeader(leftHeader: "Другое", rightHeader: nil, collectionView: collectionView, kind: kind, indexPath: indexPath)
        }
    }

    // MARK: - Func for header

    func jointHeader(leftHeader: String, rightHeader: String?, collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: HeaderView.identifier,
                                                                     for: indexPath) as? HeaderView
        header?.configure(leftHeader: leftHeader, rightHeader: rightHeader)
        return header ?? UICollectionReusableView()
    }
}
