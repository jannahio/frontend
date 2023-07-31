// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetUXListQuery: GraphQLQuery {
  public static let operationName: String = "getUXList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getUXList { allUxs { __typename id name slug description } }"#
    ))

  public init() {}

  public struct Data: JannahAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JannahAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("allUxs", [AllUx?]?.self),
    ] }

    public var allUxs: [AllUx?]? { __data["allUxs"] }

    /// AllUx
    ///
    /// Parent Type: `UXType`
    public struct AllUx: JannahAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahAPI.Objects.UXType }
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
