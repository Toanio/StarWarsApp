//
//  Vehicles.swift
//  StarWarsApp
//
//  Created by c.toan on 08.08.2023.
//

import Foundation

struct Planet: Codable {
    let count: Int?
    let results: [PlanetResults]
}

// MARK: - Result
struct PlanetResults: Codable {
    let name, rotationPeriod, orbitalPeriod, diameter: String?
    let climate, gravity, terrain, surfaceWater: String?
    let population: String?
    let residents, films: [String]?
    let created, edited: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}
