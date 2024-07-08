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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        print("LL")
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
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "This \(indexPath)"
        return cell
    }
    

}

extension ViewController: UITableViewDelegate {

}

