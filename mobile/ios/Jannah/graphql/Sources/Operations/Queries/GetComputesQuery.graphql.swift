// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetComputesQuery: GraphQLQuery {
  public static let operationName: String = "getComputes"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query getComputes {
        allComputes {
          __typename
          name
          description
        }
      }
      """#
    ))

  public init() {}

  public struct Data: Graphql.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Graphql.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("allComputes", [AllCompute?]?.self),
    ] }

    public var allComputes: [AllCompute?]? { __data["allComputes"] }

    /// AllCompute
    ///
    /// Parent Type: `ComputeType`
    public struct AllCompute: Graphql.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Graphql.Objects.ComputeType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("description", String.self),
      ] }

      public var name: String { __data["name"] }
      public var description: String { __data["description"] }
    }
  }
}
