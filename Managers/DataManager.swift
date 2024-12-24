//
//  DataManager.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import Foundation

// DataManager is a utility class designed to manage data-related operations across application. Other functions can also be added to fetch data from API.
// It follows the singleton design pattern, ensuring there is only one shared instance accessible via `DataManager.shared`
class DataManager {
    static let shared = DataManager()

    private init() { }

    /// A generic method to load and decode data from a particular file path (json file)
    func fetchData<T: Codable>(from jsonFile: String, resultType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        if let url = Bundle.main.url(forResource: jsonFile, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
