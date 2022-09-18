//
//  RocketDetailsViewModel.swift
//  SpaceX
//
//  Created by Julia on 11.09.2022.
//

import SwiftUI
import Apollo

protocol RocketDetailsViewModelProtocol {
    var data: RocketsQuery.Data.Rocket? { get }
    
    var name: String { get }
    var description: String { get }
    var costPerLaunch: String { get }
    var successRate: String { get }
    var mass: String { get }
    var height: String { get }
    var diameter: String { get }
    var active: String { get }
}

class RocketDetailsViewModel: RocketDetailsViewModelProtocol, ObservableObject {
    var data: RocketsQuery.Data.Rocket?
    
    init(data: RocketsQuery.Data.Rocket?) {
        self.data = data
    }
    
    var name: String {
        data?.name ?? "No info"
    }
    
    var description: String {
        data?.description ?? "No info"
    }
    
    var costPerLaunch: String {
        "\(data?.costPerLaunch ?? 0)"
    }
    
    var successRate: String {
        "\(data?.successRatePct ?? 0)%"
    }
    
    var mass: String {
        "\(data?.mass?.kg ?? 0)KG"
    }
    
    var height: String {
        "\(data?.height?.meters ?? 0)M"
    }
    
    var diameter: String {
        "\(data?.diameter?.meters ?? 0)M"
    }
    
    var active: String {
        "\(data?.active ?? false)"
    }
}
