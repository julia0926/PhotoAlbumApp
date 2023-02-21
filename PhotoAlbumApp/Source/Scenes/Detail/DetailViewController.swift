//
//  DetailViewController.swift
//  PhotoAlbumApp
//
//  Created by Julia on 2023/02/18.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var navigationTitle: String = ""
    var imageItems = [UIImage]()
    var alertItems = [AlertModel]()
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DetailCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private let cellSpacing: CGFloat = 4
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavigation()
        self.setUpLayouts()
    }
    
    private func setUpNavigation() {
        self.navigationItem.title = navigationTitle
    }

    private func setUpLayouts() {
        self.view.addSubview(photoCollectionView)
        
        photoCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: DetailCell.self, for: indexPath)
        cell.configure(imageItems[indexPath.row])
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fileName = alertItems[indexPath.row].fileName
        let fileSize = alertItems[indexPath.row].fileSize
        let message = "파일명 : \(fileName) \n 파일 크기 : \(fileSize)"
        let alert = UIAlertController(title: "사진 정보", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 3 - cellSpacing
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellSpacing
    }
}
