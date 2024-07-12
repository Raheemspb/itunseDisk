//
//  ViewController.swift
//  ItunseDisk
//
//  Created by Рахим Габибли on 08.07.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    var collectionView: UICollectionView!
    let networkManager = NetworkManager()
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupSearchBar()
        setupCollectionView()
        networkManager.getCharacter { [weak self] albums in
            self?.albums = albums

            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }

    private func setupCollectionView() {
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewFlowlayout()
        )
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseId)

        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }

    }

    private func collectionViewFlowlayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: 380, height: 80)

        return layout
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }

        let album = albums[indexPath.item]
        guard let imageUrl = URL(string: album.artworkUrl100) else { return cell }

        DispatchQueue.global(qos: .utility).async {
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else { return }

                cell.albumLabel.text = album.collectionName
                cell.singerLabel.text = album.artistName
                cell.albumImage.image = UIImage(data: imageData)
                cell.trackCountLabel.text = "\(album.trackCount) tracks"
            }
        }
        return cell

    }

}

extension ViewController: UICollectionViewDelegate {

}
