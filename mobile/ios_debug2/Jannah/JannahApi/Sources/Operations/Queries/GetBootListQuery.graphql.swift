// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetBootListQuery: GraphQLQuery {
  public static let operationName: String = "getBootList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query getBootList {
        allBoots {
          __typename
          id
          name
          slug
          description
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
      .field("allBoots", [AllBoot?]?.self),
    ] }

    public var allBoots: [AllBoot?]? { __data["allBoots"] }

    /// AllBoot
    ///
    /// Parent Type: `BootType`
    public struct AllBoot: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.BootType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", JannahApi.ID.self),
        .field("name", String.self),
        .field("slug", String.self),
        .field("description", String.self),
      ] }

      public var id: JannahApi.ID { __data["id"] }
      public var name: String { __data["name"] }
      public var slug: String { __data["slug"] }
      public var description: String { __data["description"] }
    }
  }
}