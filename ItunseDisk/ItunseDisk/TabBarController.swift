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
    let searchHistoryViewController = SearchHistoryViewController()
    let viewController = ViewController()
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewControllers()
        setupSearchBar()
    }

    private func setupSearchBar() {
        searchBar.placeholder = "Search"
        searchBar.delegate = self

        // Добавляем searchBar в navigationController первого контроллера
        if let navController = viewControllers?.first as? UINavigationController {
            navController.navigationBar.topItem?.titleView = searchBar
        }
    }

    private func setupViewControllers() {
        // Create UINavigationController for each ViewController
        let searchNavController = UINavigationController(rootViewController: viewController)
        searchNavController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)

        let historyNavController = UINavigationController(rootViewController: searchHistoryViewController)
        historyNavController.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock"), tag: 1)

        viewControllers = [searchNavController, historyNavController]
    }
}

extension TabBarController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return
        }

        searchHistoryViewController.searchHistory.append(searchText)
        print(searchHistoryViewController.searchHistory.count)

        networkManager.getCharacter(albumName: searchText) { [weak self] albums in
            self?.albums = albums

            DispatchQueue.main.async {
                self?.viewController.albums = albums
                self?.viewController.collectionView.reloadData()
                self?.searchHistoryViewController.tableView.reloadData()
            }
        }

        searchBar.resignFirstResponder()
    }
}

//class TabBarController: UITabBarController {
//
//    var searchBar = UISearchBar()
//    let networkManager = NetworkManager()
//    let searchHistoryViewController = SearchHistoryViewController()
//    let viewController = ViewController()
//    var albums = [Album]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupSearchBar()
//        setupViewControllers()
//    }
//
//    private func setupSearchBar() {
//        searchBar.placeholder = "Search"
//        searchBar.delegate = self
//        navigationItem.titleView = searchBar
//    }
//
//    private func setupViewControllers() {
//        // Create UINavigationController for each ViewController
//        let searchNavController = UINavigationController(rootViewController: viewController)
//        searchNavController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
//
//        let historyNavController = UINavigationController(rootViewController: searchHistoryViewController)
//        historyNavController.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock"), tag: 1)
//
//        viewControllers = [searchNavController, historyNavController]
//    }
//}
//
//extension TabBarController: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchText = searchBar.text, !searchText.isEmpty else {
//            return
//        }
//
//        searchHistoryViewController.searchHistory.append(searchText)
//        print(searchHistoryViewController.searchHistory.count)
//
//        networkManager.getCharacter(albumName: searchText) { [weak self] albums in
//            self?.albums = albums
//
//            DispatchQueue.main.async {
//                self?.viewController.albums = albums
//                self?.viewController.collectionView.reloadData()
//                self?.searchHistoryViewController.tableView.reloadData()
//            }
//        }
//
//        searchBar.resignFirstResponder()
//    }
//}

//class TabBarController: UITabBarController {
//
//    var searchBar = UISearchBar()
//    let networkManager = NetworkManager()
//    let searchHistoryViewController = SearchHistoryViewController()
//    let viewController = ViewController()
//    var albums = [Album]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupSearchBar()
//        setupViewControllers()
//    }
//
//    private func setupSearchBar() {
//        searchBar.placeholder = "Search"
//        searchBar.delegate = self
//        navigationItem.titleView = searchBar
//        }
//
//
//    func setupViewControllers() {
//
//        viewControllers = [
//            generateViewControllers(
//            viewController: ViewController(),
//            image: UIImage(systemName: "magnifyingglass"),
//            title: "Search"),
//            generateViewControllers(
//                viewController: SearchHistoryViewController(),
//                image: UIImage(systemName: "clock"),
//                title: "History"
//            )
//        ]
//    }
//
//    func generateViewControllers(viewController: UIViewController, image: UIImage?, title: String) -> UIViewController {
//        viewController.tabBarItem.image = image
//        viewController.tabBarItem.title = title
//        return viewController
//    }
//
//
//}
//
//extension TabBarController: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchText = searchBar.text, !searchText.isEmpty else {
//            return
//        }
//
//        searchHistoryViewController.searchHistory.append(searchText)
//        print(searchHistoryViewController.searchHistory.count)
//
//        networkManager.getCharacter(albumName: searchText) { [weak self] albums in
//            self?.albums = albums
//
//            DispatchQueue.main.async {
//                self?.viewController.collectionView.reloadData()
//            }
//        }
//
//        searchBar.resignFirstResponder()
//    }
//}

