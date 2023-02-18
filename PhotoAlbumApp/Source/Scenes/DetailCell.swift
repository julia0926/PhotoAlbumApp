//
//  DetailCell.swift
//  PhotoAlbumApp
//
//  Created by Julia on 2023/02/18.
//

import UIKit

final class DetailCell: UICollectionViewCell {
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ image: UIImage) {
        self.photoImageView.image = image
    }
    
    private func setupLayouts() {
        self.addSubview(photoImageView)
        
        self.photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
}

