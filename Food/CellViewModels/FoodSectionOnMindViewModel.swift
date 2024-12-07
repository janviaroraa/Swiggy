//
//  FoodSectionOnMindViewModel.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import Foundation

protocol FoodSectionOnMindViewModelDelegate: AnyObject {
    func didFetchData()
}

/// ViewModel corresponding to FoodSectionOnMindCell
class FoodSectionOnMindViewModel {
    var data: [FoodSectionFilterItemsDataModel] = []
    weak var delegate: FoodSectionOnMindViewModelDelegate?

    func fetchData() {
        DataManager.shared.fetchData(from: "FoodSectionOnMind", resultType: [FoodSectionFilterItemsDataModel].self) { [weak self] result in
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
