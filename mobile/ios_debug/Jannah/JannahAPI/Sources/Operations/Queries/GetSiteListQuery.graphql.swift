// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetSiteListQuery: GraphQLQuery {
  public static let operationName: String = "getSiteList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getSiteList { allSites { __typename id name description logo } }"#
    ))

  public init() {}

  public struct Data: JannahAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JannahAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("allSites", AllSites?.self),
    ] }

    public var allSites: AllSites? { __data["allSites"] }

    /// AllSites
    ///
    /// Parent Type: `JannahSiteType`
    public struct AllSites: JannahAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahAPI.Objects.JannahSiteType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", JannahAPI.ID.self),
        .field("name", String.self),
        .field("description", String.self),
        .field("logo", String.self),
      ] }

      public var id: JannahAPI.ID { __data["id"] }
      public var name: String { __data["name"] }
      public var description: String { __data["description"] }
      public var logo: String { __data["logo"] }
    }
  }
}
