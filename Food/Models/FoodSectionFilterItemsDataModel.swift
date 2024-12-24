//
//  FoodSectionFilterItemsDataModel.swift
//  Swiggy
//
//  Created by Janvi Arora on 24/12/24.
//

import Foundation

/// Represents an item in the "Food Section Filter Items".
/// Conforms to `Codable` for encoding and decoding from json.
struct FoodSectionFilterItemsDataModel: Codable {
    let title: String
    let imageName: String
    let category: String
    let description: String

    /// image_name is used in json to replicate the data format we get from server.
    /// CodingKeys are used to map the JSON keys to the struct properties
    enum CodingKeys: String, CodingKey {
        case title, category, description
        case imageName = "image_name"
    }
}
