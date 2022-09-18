//
//  RocketsViewModel.swift
//  SpaceX
//
//  Created by Julia on 06.09.2022.
//

import Foundation

protocol RocketsViewModelProtocol {
    var spaceXService: SpaceXAPI { get }
    var data: RocketsQuery.Data? { get set }
    
    func fetch(completion: @escaping() -> Void)
}

class RocketsViewModel: RocketsViewModelProtocol, ObservableObject {
    
    init(spaceXService: SpaceXAPI = SpaceXService()) {
        self.spaceXService = spaceXService
    }
    
    var spaceXService: SpaceXAPI
    
    @Published var data: RocketsQuery.Data?
    
    func fetch(completion: @escaping() -> Void) {
        _ = spaceXService.executeRocketsQuery { result in
            switch result {
            case .success(let success):
                self.data = success.data
                completion()
            case .failure(_):
                break
            }
        }
    }
}
