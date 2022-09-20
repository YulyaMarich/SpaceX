//
//  HomeViewModel.swift
//  SpaceX
//
//  Created by Julia on 18.07.2022.
//

import Foundation
import Apollo

protocol HomeViewModelProtocol {
    var spaceXService: SpaceXAPI { get }
    var data: HomeInfoQuery.Data? { get set }
    var histories: [HomeInfoQuery.Data.History?] { get }
    var company: HomeInfoQuery.Data.Company? { get }
    
    func fetch(completion: @escaping() -> Void)
}

class HomeViewModel: HomeViewModelProtocol {
    init(spaceXService: SpaceXAPI = SpaceXService()) {
        self.spaceXService = spaceXService
    }
    
    var company: HomeInfoQuery.Data.Company? {
        data?.company
    }
    
    var histories: [HomeInfoQuery.Data.History?] {
        data?.histories ?? [HomeInfoQuery.Data.History()]
    }
    
    var spaceXService: SpaceXAPI = SpaceXService()
    
    var data: HomeInfoQuery.Data?
    
    func fetch(completion: @escaping() -> Void) {
        _ = spaceXService.executeHomeInfoQuery { result in
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
