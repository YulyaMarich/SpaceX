//
//  SpaceXAPI.swift
//  SpaceX
//
//  Created by Julia on 17.07.2022.
//

import Foundation
import Apollo

protocol SpaceXAPI {
    func executeHomeInfoQuery(completion: ((Result<GraphQLResult<HomeInfoQuery.Data>, Error>) -> Void)?) -> Cancellable?
}
