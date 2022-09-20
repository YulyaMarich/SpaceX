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
    var variables: [String] { get }
    var results: [String] { get }
}

class RocketDetailsViewModel: RocketDetailsViewModelProtocol, ObservableObject {
    var variables: [String] {
        ["Cost per launch", "Success rate", "Mass", "Height", "Diameter", "Active"]
    }
    
    var results: [String] {
        [costPerLaunch, successRate, mass, height, diameter, active]
    }
    
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
    
   private var costPerLaunch: String {
        "\(data?.costPerLaunch ?? 0)"
    }
    
    private var successRate: String {
        "\(data?.successRatePct ?? 0)%"
    }
    
    private var mass: String {
        "\(data?.mass?.kg ?? 0)KG"
    }
    
    private var height: String {
        "\(data?.height?.meters ?? 0)M"
    }
    
    private var diameter: String {
        "\(data?.diameter?.meters ?? 0)M"
    }
    
    private var active: String {
        "\(data?.active ?? false)"
    }
}
