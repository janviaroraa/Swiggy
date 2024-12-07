//
//  AddressDataModel.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import Foundation

enum AddressType: String, Codable {
    case home
    case office
    case workplace
    case other
}

/// Represents an address in the dropdown menu list of Header address
/// Conforms to `Codable` for encoding and decoding from json.
struct AddressDataModel: Codable {
    let type: AddressType
    let address: String
}
