// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class BootListQuery: GraphQLQuery {
  public static let operationName: String = "BootList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query BootList {
        boots {
          __typename
          cursor
          hasMore
          boots {
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
      .field("boots", Boots?.self),
    ] }

    public var boots: Boots? { __data["boots"] }

    /// Boots
    ///
    /// Parent Type: `QueryBoots`
    public struct Boots: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.QueryBoots }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cursor", Int?.self),
        .field("hasMore", Bool?.self),
        .field("boots", [Boot?]?.self),
      ] }

      public var cursor: Int? { __data["cursor"] }
      public var hasMore: Bool? { __data["hasMore"] }
      public var boots: [Boot?]? { __data["boots"] }

      /// Boots.Boot
      ///
      /// Parent Type: `BootType`
      public struct Boot: JannahApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.BootType }
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
