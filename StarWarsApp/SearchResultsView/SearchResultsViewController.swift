//
//  SearchResultsViewController.swift
//  StarWarsApp
//
//  Created by c.toan on 08.08.2023.
//

import UIKit
import SnapKit

enum Sections: Int {
    case people = 0
    case starchips = 1
    case planet = 2
}

class SearchResultsViewController: UIViewController {
    init(presenter: SearchResultsViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var presenter: SearchResultsViewPresenterProtocol
    
    let searchResultsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: ResultsTableViewCell.identifier)
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = true
        return tableView
    }()
    
    private let testLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
    }
    
    private func configureUI() {
        view.addSubview(searchResultsTableView)
        searchResultsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Герои"
        case 1:
            return "Звездолеты"
        case 2:
            return "Планеты"
        default:
            return "Не найдено"
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return presenter.peopleResults.count
        case 1:
            return presenter.starshipsResults.count
        case 2:
            return presenter.planetResults.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultsTableViewCell.identifier, for: indexPath) as? ResultsTableViewCell else { return UITableViewCell()}
        cell.delegate = self
        switch indexPath.section {
        case Sections.people.rawValue:
            cell.configure(with: presenter.peopleResults[indexPath.row])
            return cell
        case Sections.starchips.rawValue:
            cell.configure(with: presenter.starshipsResults[indexPath.row])
            return cell
        case Sections.planet.rawValue:
            cell.configure(with: presenter.planetResults[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension SearchResultsViewController: ResultsTableViewCellDelegate {
    func saveButtonTapped() {
        print("tapped")
    }
}

extension SearchResultsViewController: MainViewControllerDelegate {
    func sendData(peopleResults: [PeopleResults], starshipsResults: [StarshipsResults], planetResults: [PlanetResults]) {
        presenter.peopleResults = peopleResults
        presenter.starshipsResults = starshipsResults
        presenter.planetResults = planetResults
        self.searchResultsTableView.reloadData()
    }
}
