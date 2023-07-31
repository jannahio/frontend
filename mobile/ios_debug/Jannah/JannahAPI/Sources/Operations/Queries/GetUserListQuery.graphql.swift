// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetUserListQuery: GraphQLQuery {
  public static let operationName: String = "getUserList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getUserList { allUsers { __typename id lastLogin isSuperuser username firstName lastName email isActive dateJoined avatar bio location website joinedDate } }"#
    ))

  public init() {}

  public struct Data: JannahAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JannahAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("allUsers", [AllUser?]?.self),
    ] }

    public var allUsers: [AllUser?]? { __data["allUsers"] }

    /// AllUser
    ///
    /// Parent Type: `UserType`
    public struct AllUser: JannahAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahAPI.Objects.UserType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", JannahAPI.ID.self),
        .field("lastLogin", JannahAPI.DateTime?.self),
        .field("isSuperuser", Bool.self),
        .field("username", String.self),
        .field("firstName", String.self),
        .field("lastName", String.self),
        .field("email", String.self),
        .field("isActive", Bool.self),
        .field("dateJoined", JannahAPI.DateTime.self),
        .field("avatar", String.self),
        .field("bio", String?.self),
        .field("location", String?.self),
        .field("website", String?.self),
        .field("joinedDate", JannahAPI.Date.self),
      ] }

      public var id: JannahAPI.ID { __data["id"] }
      public var lastLogin: JannahAPI.DateTime? { __data["lastLogin"] }
      /// Designates that this user has all permissions without explicitly assigning them.
      public var isSuperuser: Bool { __data["isSuperuser"] }
      /// Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
      public var username: String { __data["username"] }
      public var firstName: String { __data["firstName"] }
      public var lastName: String { __data["lastName"] }
      public var email: String { __data["email"] }
      /// Designates whether this user should be treated as active. Unselect this instead of deleting accounts.
      public var isActive: Bool { __data["isActive"] }
      public var dateJoined: JannahAPI.DateTime { __data["dateJoined"] }
      public var avatar: String { __data["avatar"] }
      public var bio: String? { __data["bio"] }
      public var location: String? { __data["location"] }
      public var website: String? { __data["website"] }
      public var joinedDate: JannahAPI.Date { __data["joinedDate"] }
    }
  }
}
