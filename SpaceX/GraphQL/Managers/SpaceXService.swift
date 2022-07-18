//
//  SpaceXService.swift
//  SpaceX
//
//  Created by Julia on 17.07.2022.
//

import Foundation
import Apollo

class SpaceXService: SpaceXAPI {
    
    private var networkManager: ApolloAPI
    
    init(networkManager: ApolloAPI = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func executeHomeInfoQuery(completion: ((Result<GraphQLResult<HomeInfoQuery.Data>, Error>) -> Void)?) -> Cancellable? {
        let homeInfoQuery = HomeInfoQuery()
        let cancalable = networkManager.fetchQuery(query: homeInfoQuery, completion: completion)
        return cancalable
    }
}
