// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UXListQuery: GraphQLQuery {
  public static let operationName: String = "UXList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query UXList {
        uxs {
          __typename
          cursor
          hasMore
          uxs {
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
      .field("uxs", Uxs?.self),
    ] }

    public var uxs: Uxs? { __data["uxs"] }

    /// Uxs
    ///
    /// Parent Type: `QueryUXs`
    public struct Uxs: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.QueryUXs }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cursor", Int?.self),
        .field("hasMore", Bool?.self),
        .field("uxs", [Ux?]?.self),
      ] }

      public var cursor: Int? { __data["cursor"] }
      public var hasMore: Bool? { __data["hasMore"] }
      public var uxs: [Ux?]? { __data["uxs"] }

      /// Uxs.Ux
      ///
      /// Parent Type: `UXType`
      public struct Ux: JannahApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.UXType }
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
