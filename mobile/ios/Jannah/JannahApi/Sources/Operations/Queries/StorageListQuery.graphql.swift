// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class StorageListQuery: GraphQLQuery {
  public static let operationName: String = "StorageList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query StorageList {
        storages {
          __typename
          cursor
          hasMore
          storages {
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
      .field("storages", Storages?.self),
    ] }

    public var storages: Storages? { __data["storages"] }

    /// Storages
    ///
    /// Parent Type: `QueryStorages`
    public struct Storages: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.QueryStorages }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cursor", Int?.self),
        .field("hasMore", Bool?.self),
        .field("storages", [Storage?]?.self),
      ] }

      public var cursor: Int? { __data["cursor"] }
      public var hasMore: Bool? { __data["hasMore"] }
      public var storages: [Storage?]? { __data["storages"] }

      /// Storages.Storage
      ///
      /// Parent Type: `StorageType`
      public struct Storage: JannahApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.StorageType }
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
