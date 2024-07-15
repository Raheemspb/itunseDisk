//
//  TabBarController.swift
//  ItunseDisk
//
//  Created by Рахим Габибли on 12.07.2024.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    var searchBar = UISearchBar()
    let networkManager = NetworkManager()
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        setupSearchBar()
        setupViewControllers()
    }

    private func setupSearchBar() {
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        }


    func setupViewControllers() {
        viewControllers = [
            generateViewControllers(
            viewController: ViewController(),
            image: UIImage(systemName: "magnifyingglass"),
            title: "Search"),
            generateViewControllers(
                viewController: SearchHistoryViewController(),
                image: UIImage(systemName: "clock"),
                title: "History"
            )
        ]
    }

    func generateViewControllers(viewController: UIViewController, image: UIImage?, title: String) -> UIViewController {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.title = title
        return viewController
    }


}

extension TabBarController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        // Обновление результатов поиска на основе текста в панели поиска
//        filterContentForSearchText(searchText)
//        if searchText != "" {
//            networkManager.getCharacter(albumName: searchText) { [weak self] albums in
//                            self?.albums = albums
//
//                            DispatchQueue.main.async {
//                                self?.collectionView.reloadData()
//                            }
//            }
//        }
    }

    func filterContentForSearchText(_ searchText: String) {
        // Реализуйте вашу логику фильтрации здесь
    }
}

