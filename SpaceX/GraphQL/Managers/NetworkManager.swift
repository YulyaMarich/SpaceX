//
//  NetworkManager.swift
//  SpaceX
//
//  Created by Julia on 17.07.2022.
//

import Foundation
import Apollo
 
class NetworkManager: ApolloAPI {

    private var network = Network.shared

    func fetchQuery<Query>(query: Query,
                                     completion: ((Result<GraphQLResult<Query.Data>, Error>) -> Void)?) -> Cancellable? where Query: GraphQLQuery {
        let cancellable = network.apollo.fetch(query: query,
                                               cachePolicy: .fetchIgnoringCacheCompletely,
                                               contextIdentifier: nil,
                                               queue: .main,
                                               resultHandler: completion)
        return cancellable
    }
}
