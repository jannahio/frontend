// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WorkflowListQuery: GraphQLQuery {
  public static let operationName: String = "WorkflowList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query WorkflowList($cursor: String) {
        workflows(cursor: $cursor) {
          __typename
          cursor
          hasMore
          workflows {
            __typename
            id
            name
            description
          }
        }
      }
      """#
    ))

  public var cursor: GraphQLNullable<String>

  public init(cursor: GraphQLNullable<String>) {
    self.cursor = cursor
  }

  public var __variables: Variables? { ["cursor": cursor] }

  public struct Data: JannahApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("workflows", Workflows?.self, arguments: ["cursor": .variable("cursor")]),
    ] }

    public var workflows: Workflows? { __data["workflows"] }

    /// Workflows
    ///
    /// Parent Type: `JannahWorkflows`
    public struct Workflows: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.JannahWorkflows }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cursor", String?.self),
        .field("hasMore", Bool?.self),
        .field("workflows", [Workflow?]?.self),
      ] }

      public var cursor: String? { __data["cursor"] }
      public var hasMore: Bool? { __data["hasMore"] }
      public var workflows: [Workflow?]? { __data["workflows"] }

      /// Workflows.Workflow
      ///
      /// Parent Type: `WorkflowType`
      public struct Workflow: JannahApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.WorkflowType }
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
