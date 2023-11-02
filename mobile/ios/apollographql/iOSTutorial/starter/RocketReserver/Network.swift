//
//  Network.swift
//  RocketReserver
//
//  Created by osman jalloh on 11/1/23.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!)
}
