// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SiteListQuery: GraphQLQuery {
  public static let operationName: String = "SiteList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query SiteList {
        sites {
          __typename
          cursor
          hasMore
          sites {
            __typename
            id
            name
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
      .field("sites", Sites?.self),
    ] }

    public var sites: Sites? { __data["sites"] }

    /// Sites
    ///
    /// Parent Type: `JannahSites`
    public struct Sites: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.JannahSites }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cursor", String?.self),
        .field("hasMore", Bool?.self),
        .field("sites", [Site?]?.self),
      ] }

      public var cursor: String? { __data["cursor"] }
      public var hasMore: Bool? { __data["hasMore"] }
      public var sites: [Site?]? { __data["sites"] }

      /// Sites.Site
      ///
      /// Parent Type: `SiteType`
      public struct Site: JannahApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.SiteType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", JannahApi.ID.self),
          .field("name", String.self),
          .field("description", String.self),
        ] }

        public var id: JannahApi.ID { __data["id"] }
        public var name: String { __data["name"] }
        public var description: String { __data["description"] }
      }
    }
  }
}
