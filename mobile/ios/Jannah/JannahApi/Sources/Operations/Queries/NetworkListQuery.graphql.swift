// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class NetworkListQuery: GraphQLQuery {
  public static let operationName: String = "NetworkList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query NetworkList {
        networks {
          __typename
          cursor
          hasMore
          networks {
            __typename
            id
            description
          }
        }
      }
      """#
    ))

  public init() {}

  public struct Data: JannahApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("networks", Networks?.self),
    ] }

    public var networks: Networks? { __data["networks"] }

    /// Networks
    ///
    /// Parent Type: `QueryNetworks`
    public struct Networks: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.QueryNetworks }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cursor", Int?.self),
        .field("hasMore", Bool?.self),
        .field("networks", [Network?]?.self),
      ] }

      public var cursor: Int? { __data["cursor"] }
      public var hasMore: Bool? { __data["hasMore"] }
      public var networks: [Network?]? { __data["networks"] }

      /// Networks.Network
      ///
      /// Parent Type: `NetworkType`
      public struct Network: JannahApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.NetworkType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", JannahApi.ID.self),
          .field("description", String.self),
        ] }

        public var id: JannahApi.ID { __data["id"] }
        public var description: String { __data["description"] }
      }
    }
  }
}
