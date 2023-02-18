//
//  ViewController.swift
//  PhotoAlbumApp
//
//  Created by Julia on 2023/02/18.
//

import UIKit
import SnapKit
import Photos

final class AlbumViewController: UIViewController {
    
    private var albums = [PHAssetCollection]()
    private let imageManager = PHCachingImageManager()
    
    private let albumTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 85
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpLayouts()
        self.setUpNavigation()
        self.configure(self.albumTableView)
    }
    
    private func setUpLayouts() {
        self.view.addSubview(albumTableView)
        
        albumTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setUpNavigation() {
        self.navigationItem.title = "앨범"
    }
    
    private func configure(_ tableView: UITableView) {
        tableView.register(AlbumCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
 

}

extension AlbumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: AlbumCell.self, for: indexPath)
//        cell.configure(albums[indexPath.row])
        return cell
    }
    
}

extension AlbumViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
