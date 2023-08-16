// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ComputeListQuery: GraphQLQuery {
  public static let operationName: String = "ComputeList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query ComputeList {
        computes {
          __typename
          cursor
          hasMore
          computes {
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
      .field("computes", Computes?.self),
    ] }

    public var computes: Computes? { __data["computes"] }

    /// Computes
    ///
    /// Parent Type: `QueryComputes`
    public struct Computes: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.QueryComputes }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cursor", Int?.self),
        .field("hasMore", Bool?.self),
        .field("computes", [Compute?]?.self),
      ] }

      public var cursor: Int? { __data["cursor"] }
      public var hasMore: Bool? { __data["hasMore"] }
      public var computes: [Compute?]? { __data["computes"] }

      /// Computes.Compute
      ///
      /// Parent Type: `ComputeType`
      public struct Compute: JannahApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.ComputeType }
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
