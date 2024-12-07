//
//  FoodViewModel.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import Foundation

/// ViewModel corresponding to FoodViewMController
class FoodViewModel {

    /// Data is set hard-coded here
    let addressData: [AddressDataModel] = [
        AddressDataModel(type: .home, address: "1234 Elm Street, Springfield, IL 62701, USA"),
        AddressDataModel(type: .office, address: "789 Corporate Ave, Suite 500, Chicago, IL 60611, USA"),
        AddressDataModel(type: .workplace, address: "1010 Business Park Blvd, San Francisco, CA 94107, USA"),
        AddressDataModel(type: .other, address: "5678 Suburban St, Apt 22, Seattle, WA 98101, USA")
    ]
}
