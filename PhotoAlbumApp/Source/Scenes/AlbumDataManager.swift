//
//  AlbumDataManager.swift
//  PhotoAlbumApp
//
//  Created by Julia on 2023/02/19.
//

import UIKit
import Photos
import RxRelay

final class AlbumDataManager {
    
    let albumDataRelay = BehaviorRelay<[AlbumModel]>(value: [])
    
    func checkPermission() {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            self.fetchAlbumsData()
        case .denied: break
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                switch $0 {
                case .authorized:
                    self.fetchAlbumsData()
                case .denied: break
                default:
                    break
                }
            })
        default:
            break
        }
    }
    
    private func fetchAlbumsData() {
        var albums : [AlbumModel] = []
        let fetchOption = PHFetchOptions()
        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        let imageOptions = PHImageRequestOptions()
        imageOptions.isSynchronous = true
        
        let fetchResult: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum,
                                                                                                    subtype: .any,
                                                                                                    options: nil)
        fetchResult.enumerateObjects { (collection, count, stop) in
            var pictures: [UIImage] = []
            guard let albumTitle = collection.localizedTitle else { return }
            
            let albumPhotos = PHAsset.fetchAssets(in: collection, options: fetchOption)
            albumPhotos.enumerateObjects { asset, count, point in
                PHCachingImageManager().requestImage(for: asset,
                                              targetSize: CGSize(width: 100, height: 100),
                                              contentMode: .aspectFill,
                                              options: imageOptions) { (image, info) in
                    guard let image = image else { return }
                    pictures.append(image)
                }
            }
            let updateModel = AlbumModel(title: albumTitle,
                                         albumCount: pictures.count,
                                         thumbnail: pictures.first ?? UIImage(systemName: "photo")!,
                                         photos: pictures)
            albums.append(updateModel)
        }
        
        self.albumDataRelay.accept(albums)
    }
     
}
