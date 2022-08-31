//
//  LaunchesViewModel.swift
//  SpaceX
//
//  Created by Julia on 13.08.2022.
//

import Foundation

protocol LaunchesViewModelProtocol {
    var spaceXService: SpaceXAPI { get }
    var data: LaunchesQuery.Data? { get set }
    
    func fetch(completion: @escaping() -> Void)
}

class LaunchesViewModel: LaunchesViewModelProtocol {
    
    init(spaceXService: SpaceXAPI = SpaceXService()) {
        self.spaceXService = spaceXService
    }
    
    var spaceXService: SpaceXAPI = SpaceXService()
    
    var data: LaunchesQuery.Data?

    let useMocks = true
    
    func fetch(completion: @escaping () -> Void) {
        if useMocks {
            do {
                data = try Mocker.loadLauchesMock()
            } catch {
                fatalError("viewModel fail")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                completion()
            }

        } else {
            _ = spaceXService.executeLaunchesQuery { result in
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
