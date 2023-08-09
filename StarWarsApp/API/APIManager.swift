//
//  APIManager.swift
//  StarWarsApp
//
//  Created by c.toan on 07.08.2023.
//

import Foundation

struct Constants {
    static let baseURL = "https://swapi.dev/api/"
}

enum APIError: Error {
    case failedTogetData
}

class APIManager {
    static let shared = APIManager()
    
//    func getAllPeople(complition: @escaping (Result<[Results], Error>) ->Void ) {
//        guard let url = URL(string: "\(Constants.baseURL)people/") else { return }
//
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            do {
//                let results = try JSONDecoder().decode(People.self, from: data)
//                complition(.success(results.results))
//            } catch {
//                complition(.failure(APIError.failedTogetData))
//            }
//        }
//        task.resume()
//    }
//
    func getPeople(with query: String, complition: @escaping (Result<[PeopleResults], Error>) ->Void ) {
        guard let url = URL(string: "\(Constants.baseURL)people?search=\(query)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(People.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getStarships(with query: String, complition: @escaping (Result<[StarshipsResults], Error>) ->Void ) {
        guard let url = URL(string: "\(Constants.baseURL)starships?search=\(query)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(Starships.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getPlanet(with query: String, complition: @escaping (Result<[PlanetResults], Error>) ->Void ) {
        guard let url = URL(string: "\(Constants.baseURL)planets?search=\(query)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(Planet.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
}
