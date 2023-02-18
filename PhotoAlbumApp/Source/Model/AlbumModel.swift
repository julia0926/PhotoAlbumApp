//
//  AlbumModel.swift
//  PhotoAlbumApp
//
//  Created by Julia on 2023/02/19.
//

import UIKit

struct AlbumModel {
    let title: String
    let albumCount: Int
    let thumbnail: UIImage
    let photos: [UIImage]
    let alertInfo: [AlertModel]
}

struct AlertModel {
    let fileName: String
    let fileSize: String
}
