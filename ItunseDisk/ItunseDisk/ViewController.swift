//
//  ViewController.swift
//  ItunseDisk
//
//  Created by Рахим Габибли on 08.07.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    var tableView: UITableView!
    let networkManager = NetworkManager()
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        networkManager.getCharacter { [weak self] albums in
            self?.albums = albums

            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 90

        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }

    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = albums[indexPath.row].collectionName
        return cell
    }
    

}

extension ViewController: UITableViewDelegate {

}

