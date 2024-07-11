//
//  TabBarController.swift
//  ItunseDisk
//
//  Created by Рахим Габибли on 12.07.2024.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewControllers()
    }


    func setupViewControllers() {
        viewControllers = [generateViewControllers(viewController: ViewController(), image: UIImage(systemName: "magnifyingglass"), title: "Search"),
                           generateViewControllers(viewController: ViewController(), image: UIImage(systemName: "clock"), title: "History")
        ]
    }

    func generateViewControllers(viewController: UIViewController, image: UIImage?, title: String) -> UIViewController {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.title = title
        return viewController
    }


}
