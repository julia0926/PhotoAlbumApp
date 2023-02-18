//
//  AlbumCell.swift
//  PhotoAlbumApp
//
//  Created by Julia on 2023/02/18.
//

import UIKit
import SnapKit

struct AlbmuModel {
    let title: String
    let imageCount: String
    let thumbnailImage: UIImage
}

final class AlbumCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.text = "Recent"
        label.textColor = .black
        return label
    }()
    
    private let imageCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.text = "4"
        label.textColor = .black
        return label
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person.fill")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayouts()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ model: AlbumModel) {
        self.titleLabel.text = model.title
        self.imageCountLabel.text = "\(model.albumCount)"
        self.thumbnailImageView.image = model.thumbnail
    }
    
    private func setupLayouts() {
        [self.titleLabel, self.imageCountLabel].forEach {
            self.infoStackView.addArrangedSubview($0)
        }
        
        [self.infoStackView, self.thumbnailImageView].forEach {
            self.contentView.addSubview($0)
        }
        
        self.thumbnailImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(70)
        }
        
        self.infoStackView.snp.makeConstraints { make in
            make.leading.equalTo(self.thumbnailImageView.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
        }
    }

}
