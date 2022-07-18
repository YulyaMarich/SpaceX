//
//  ApolloAPI.swift
//  SpaceX
//
//  Created by Julia on 17.07.2022.
//

import Foundation
import Apollo

protocol ApolloAPI {
    func fetchQuery<Query>(query: Query,
                           completion: ((Result<GraphQLResult<Query.Data>, Error>) -> Void)?) -> Cancellable? where Query: GraphQLQuery
}

