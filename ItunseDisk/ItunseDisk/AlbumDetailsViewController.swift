//
//  AlbumDetailsViewController.swift
//  ItunseDisk
//
//  Created by Рахим Габибли on 12.07.2024.
//

import UIKit

class AlbumDetailsViewController: UIViewController {

    let albumImage = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private func setup() {
        view.addSubview(albumImage)
        albumImage.image = UIImage(systemName: "star.fill")
        albumImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(120)
        }
    }


}
