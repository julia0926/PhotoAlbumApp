//
//  DetailViewController.swift
//  PhotoAlbumApp
//
//  Created by Julia on 2023/02/18.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = CGFloat(cellSpacing)
        layout.minimumInteritemSpacing = CGFloat(cellSpacing)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(DetailCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private let cellSpacing: Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavigation()
        self.setUpLayouts()
    }
    
    private func setUpNavigation() {
        self.navigationItem.title = "Recent"
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
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: DetailCell.self, for: indexPath)
        return cell
    }
    
}

extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "사진정보", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size =  Int(UIScreen.main.bounds.width / 3)
        return CGSize(width: size - (cellSpacing * 6), height: 100)
    }
}
