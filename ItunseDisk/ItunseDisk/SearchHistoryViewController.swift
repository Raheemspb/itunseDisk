//
//  SearchHistoryViewController.swift
//  ItunseDisk
//
//  Created by Рахим Габибли on 12.07.2024.
//

import UIKit

class SearchHistoryViewController: UIViewController {

    let identifire = "searchCell"
    var searchHistory = [String]()

    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        tableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        tableView.dataSource = self

        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }

}

extension SearchHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        cell.textLabel?.text = searchHistory[indexPath.row]
        return cell
    }
    

}
