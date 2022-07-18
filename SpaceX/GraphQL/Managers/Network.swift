//
//  Network.swift
//  SpaceX
//
//  Created by Julia on 17.07.2022.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
}
