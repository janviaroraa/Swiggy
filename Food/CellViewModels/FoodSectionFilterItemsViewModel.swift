//
//  FoodSectionFilterItemsViewModel.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import Foundation

protocol FoodSectionFilterItemsViewModelDelegate: AnyObject {
    func didFetchData()
}

/// ViewModel corresponding to FoodSectionFilterItemsCell
class FoodSectionFilterItemsViewModel {
    var data: [FoodSectionFilterItemsDataModel] = []
    weak var delegate: FoodSectionFilterItemsViewModelDelegate?

    func fetchData() {
        DataManager.shared.fetchData(from: "FoodSectionFilterItems", resultType: [FoodSectionFilterItemsDataModel].self) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                self.data = data
                self.delegate?.didFetchData()
            case .failure(let error):
                print("Failed to fetch data: \(error)")
            }
        }
    }
}
