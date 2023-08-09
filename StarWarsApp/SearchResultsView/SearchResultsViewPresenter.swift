//
//  SearchResultsViewPresenter.swift
//  StarWarsApp
//
//  Created by c.toan on 09.08.2023.
//

import Foundation

protocol SearchResultsViewPresenterProtocol {
    var peopleResults: [PeopleResults] { get set}
    var starshipsResults: [StarshipsResults]{ get set }
    var planetResults: [PlanetResults]{ get set }
}

class SearchResultsViewPresenter: SearchResultsViewPresenterProtocol {
    var peopleResults = [PeopleResults]()
    var starshipsResults = [StarshipsResults]()
    var planetResults = [PlanetResults]()
}


