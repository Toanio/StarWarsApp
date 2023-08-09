//
//  People.swift
//  StarWarsApp
//
//  Created by c.toan on 07.08.2023.
//

import Foundation

// MARK: - People
struct People: Codable {
    let count: Int?
    let results: [PeopleResults]
}

// MARK: - Result
struct PeopleResults: Codable {
    let name, height, mass, hairColor: String?
    let skinColor, eyeColor, birthYear, gender: String?
    let homeworld: String?
    let films, species, vehicles, starships: [String]?
    let created, edited: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld, films, species, vehicles, starships, created, edited, url
    }
}

