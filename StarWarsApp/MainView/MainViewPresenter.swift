//
//  MainViewPresenter.swift
//  StarWarsApp
//
//  Created by c.toan on 09.08.2023.
//

import UIKit

protocol MainViewPresenterProtocol {
    var peopleResults: [PeopleResults] { get }
    var starshipsResults: [StarshipsResults]{ get }
    var planetResults: [PlanetResults]{ get }
    func fetchData(with query: String, viewController: UIViewController)
}

class MainViewPresenter: MainViewPresenterProtocol {
    var peopleResults = [PeopleResults]()
    var starshipsResults = [StarshipsResults]()
    var planetResults = [PlanetResults]()
    
    func fetchData(with query: String, viewController: UIViewController) {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        APIManager.shared.getPeople(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    self.peopleResults = result
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        APIManager.shared.getStarships(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    self.starshipsResults = result
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        APIManager.shared.getPlanet(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    self.planetResults = result
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            guard let vc = viewController as? SearchResultsViewController else {return}
            vc.sendData(peopleResults: self.peopleResults, starshipsResults: self.starshipsResults, planetResults: self.planetResults)
        }
    }
}
