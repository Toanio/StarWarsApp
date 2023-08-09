//
//  FavoritesViewController.swift
//  StarWarsApp
//
//  Created by c.toan on 08.08.2023.
//

import UIKit

class FavoritesViewController: UIViewController {
    init(presenter: FavoritesViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let presenter: FavoritesViewPresenterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Избранное"
    }

}
