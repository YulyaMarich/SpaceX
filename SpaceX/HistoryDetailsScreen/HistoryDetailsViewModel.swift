//
//  HistoryDetailsViewModel.swift
//  SpaceX
//
//  Created by Julia on 16.09.2022.
//

import Foundation

protocol HistoryDetailsViewModelProtocol {
    var data: HomeInfoQuery.Data.History { get }
    var flight: ApIflight? { get }
    var tilte: String { get }
    var missionName: String { get }
    var videoURL: String { get }
}

class HistoryDetailsViewModel: HistoryDetailsViewModelProtocol {
    var tilte: String {
        data.title ?? "No info"
    }
    
    var missionName: String {
        flight?.missionName ?? "No info"
    }
    
    var videoURL: String {
        data.flight?.fragments.apIflight.links?.videoLink ?? ""
    }
    
    var flight: ApIflight?
    
    var data: HomeInfoQuery.Data.History
    
    init(data: HomeInfoQuery.Data.History) {
        self.data = data
        self.flight = data.flight?.fragments.apIflight
    }
}
