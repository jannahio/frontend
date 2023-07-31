// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetNetworkListQuery: GraphQLQuery {
  public static let operationName: String = "getNetworkList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getNetworkList { allNetworks { __typename id name slug description } }"#
    ))

  public init() {}

  public struct Data: JannahAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JannahAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("allNetworks", [AllNetwork?]?.self),
    ] }

    public var allNetworks: [AllNetwork?]? { __data["allNetworks"] }

    /// AllNetwork
    ///
    /// Parent Type: `NetworkType`
    public struct AllNetwork: JannahAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahAPI.Objects.NetworkType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", JannahAPI.ID.self),
        .field("name", String.self),
        .field("slug", String.self),
        .field("description", String.self),
      ] }

      public var id: JannahAPI.ID { __data["id"] }
      public var name: String { __data["name"] }
      public var slug: String { __data["slug"] }
      public var description: String { __data["description"] }
    }
  }
}
