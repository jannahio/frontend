// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FeedbackListQuery: GraphQLQuery {
  public static let operationName: String = "FeedbackList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query FeedbackList {
        feedbacks {
          __typename
          cursor
          hasMore
          feedbacks {
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
      .field("feedbacks", Feedbacks?.self),
    ] }

    public var feedbacks: Feedbacks? { __data["feedbacks"] }

    /// Feedbacks
    ///
    /// Parent Type: `QueryFeedbacks`
    public struct Feedbacks: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.QueryFeedbacks }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cursor", Int?.self),
        .field("hasMore", Bool?.self),
        .field("feedbacks", [Feedback?]?.self),
      ] }

      public var cursor: Int? { __data["cursor"] }
      public var hasMore: Bool? { __data["hasMore"] }
      public var feedbacks: [Feedback?]? { __data["feedbacks"] }

      /// Feedbacks.Feedback
      ///
      /// Parent Type: `FeedbackType`
      public struct Feedback: JannahApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.FeedbackType }
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
