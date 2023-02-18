//
//  UICollectionView+Extenstion.swift
//  PhotoAlbumApp
//
//  Created by Julia on 2023/02/18.
//

import UIKit

extension UICollectionView {

    func register<Cell: UICollectionViewCell>(_ type: Cell.Type) {
        self.register(type, forCellWithReuseIdentifier: String(describing: type))
    }

    func dequeueReusableCell<Cell: UICollectionViewCell>(
        type: Cell.Type,
        for indexPath: IndexPath
    ) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as? Cell else {
            fatalError("identifier: \(String(describing: type)) can not dequeue cell")
        }
        return cell
    }
}
