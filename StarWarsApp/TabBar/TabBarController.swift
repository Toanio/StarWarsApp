//
//  ViewController.swift
//  StarWarsApp
//
//  Created by c.toan on 07.08.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.backgroundColor = .white
        let mainPresenter = MainViewPresenter()
        let mainController = MainViewController(presenter: mainPresenter)
        
        let favoritesPresenter = FavoritesViewPresenter()
        let favoritesController = FavoritesViewController(presenter: favoritesPresenter)
        
        let mainNavigation = UINavigationController(rootViewController: mainController)
        let favoritesNavigation = UINavigationController(rootViewController: favoritesController)
        
        mainNavigation.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), tag: 1)
        favoritesNavigation.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "bookmark"), tag: 2)
        
        setViewControllers([ mainNavigation, favoritesNavigation], animated: true)
    }
}

