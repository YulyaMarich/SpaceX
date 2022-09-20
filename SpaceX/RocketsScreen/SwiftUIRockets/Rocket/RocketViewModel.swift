//
//  RocketViewModel.swift
//  SpaceX
//
//  Created by Julia on 18.09.2022.
//

import Foundation
protocol RocketViewModelProtocol {
    var data: RocketsQuery.Data.Rocket? { get }
    var name: String { get }
}

class RocketViewModel: RocketViewModelProtocol, ObservableObject {
    init(data: RocketsQuery.Data.Rocket?) {
        self.data = data
    }
    
    var data: RocketsQuery.Data.Rocket?
    
    var name: String {
        data?.name ?? "No info"
    }
}
