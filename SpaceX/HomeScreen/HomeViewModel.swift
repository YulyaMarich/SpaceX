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
    
    func fetch(completion: @escaping() -> Void)
}

class HomeViewModel: HomeViewModelProtocol {
    
    init(spaceXService: SpaceXAPI = SpaceXService()) {
        self.spaceXService = spaceXService
    }

    var spaceXService: SpaceXAPI = SpaceXService()
    
    var data: HomeInfoQuery.Data?

    let useMocks = true

    func fetch(completion: @escaping() -> Void) {
        if useMocks {
            do {
                data = try Mocker.loadHomeInfoMock()
            } catch {
                fatalError("viewModel fail")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                completion()
            }

        } else {
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
}
