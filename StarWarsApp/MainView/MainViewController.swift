//
//  MainViewController.swift
//  StarWarsApp
//
//  Created by c.toan on 08.08.2023.
//

import UIKit

protocol MainViewControllerDelegate {
    func sendData(peopleResults: [PeopleResults], starshipsResults: [StarshipsResults], planetResults: [PlanetResults])
}

class MainViewController: UIViewController {
    init(presenter: MainViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let presenter: MainViewPresenterProtocol
    var delegate: MainViewControllerDelegate?
    
    private let searchController: UISearchController = {
        let presenter = SearchResultsViewPresenter()
        let search = UISearchController(searchResultsController: SearchResultsViewController(presenter: presenter))
        return search
    }()
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.text = "«Всегда делись тем, чему ты научился».(c) Магистр Йода"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    private let imageYoda: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Yoda")
        image.translatesAutoresizingMaskIntoConstraints = true
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        searchController.searchResultsUpdater = self
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Главная"
        
        navigationItem.searchController = searchController
        
        view.addSubview(imageYoda)
        view.addSubview(quoteLabel)
        imageYoda.snp.makeConstraints { make in
        make.center.equalToSuperview()
        }

        quoteLabel.snp.makeConstraints { make in
        make.top.equalTo(imageYoda.snp.bottom).offset(10)
        make.leading.equalToSuperview().offset(5)
        make.trailing.equalToSuperview().offset(-5)
        }
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        guard let query = searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty, query.trimmingCharacters(in: .whitespaces).count >= 2,
              let resultController = searchController.searchResultsController as? SearchResultsViewController else { return }
        presenter.fetchData(with: query, viewController: resultController)
    }    
}

