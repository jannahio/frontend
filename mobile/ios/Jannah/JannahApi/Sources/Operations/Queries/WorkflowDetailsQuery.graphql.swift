// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WorkflowDetailsQuery: GraphQLQuery {
  public static let operationName: String = "WorkflowDetails"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query WorkflowDetails($id: String!) {
        workflow(id: $id) {
          __typename
          id
          name
          description
          isStarted
        }
      }
      """#
    ))

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: JannahApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("workflow", Workflow?.self, arguments: ["id": .variable("id")]),
    ] }

    public var workflow: Workflow? { __data["workflow"] }

    /// Workflow
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
        .field("isStarted", Bool.self),
      ] }

      public var id: JannahApi.ID { __data["id"] }
      public var name: String { __data["name"] }
      public var description: String { __data["description"] }
      public var isStarted: Bool { __data["isStarted"] }
    }
  }
}
