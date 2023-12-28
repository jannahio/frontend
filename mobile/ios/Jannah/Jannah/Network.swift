//
//  Network.swift
//  Jannah
//
//  Created by Osman Jalloh on 7/29/23.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://devjannahio.local:8000/graphql")!)
}
