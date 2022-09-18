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
        let cancallable = networkManager.fetchQuery(query: homeInfoQuery, completion: completion)
        return cancallable
    }
    
    func executeLaunchesQuery(completion: ((Result<GraphQLResult<LaunchesQuery.Data>, Error>) -> Void)?) -> Cancellable? {
        let launchesQuery = LaunchesQuery()
        let cancallable = networkManager.fetchQuery(query: launchesQuery, completion: completion)
        return cancallable
    }
    
    func executeRocketsQuery(completion: ((Result<GraphQLResult<RocketsQuery.Data>, Error>) -> Void)?) -> Cancellable? {
        let rocketsQuery = RocketsQuery()
        let cancallable = networkManager.fetchQuery(query: rocketsQuery, completion: completion)
        return cancallable
    }
}
