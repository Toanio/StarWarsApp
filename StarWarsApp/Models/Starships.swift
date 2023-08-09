//
//  Starships.swift
//  StarWarsApp
//
//  Created by c.toan on 08.08.2023.
//

import Foundation

// MARK: - Starships
struct Starships: Codable {
    let count: Int?
    let results: [StarshipsResults]
}

// MARK: - Result
struct StarshipsResults: Codable {
    let name, model, manufacturer, costInCredits: String?
    let length, maxAtmospheringSpeed, crew, passengers: String?
    let cargoCapacity, consumables, hyperdriveRating, mglt: String?
    let starshipClass: String?
    let films: [String]?
    let created, edited: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew, passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case starshipClass = "starship_class"
        case films, created, edited, url
    }
}
