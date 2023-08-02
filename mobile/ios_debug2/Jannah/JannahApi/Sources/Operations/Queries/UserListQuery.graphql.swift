// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserListQuery: GraphQLQuery {
  public static let operationName: String = "UserList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query UserList {
        users {
          __typename
          cursor
          hasMore
          users {
            __typename
            id
            lastLogin
            isSuperuser
            username
            firstName
            lastName
            email
            isActive
            dateJoined
            avatar
            bio
            location
            website
            joinedDate
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
      .field("users", Users?.self),
    ] }

    public var users: Users? { __data["users"] }

    /// Users
    ///
    /// Parent Type: `QueryUsers`
    public struct Users: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.QueryUsers }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cursor", Int?.self),
        .field("hasMore", Bool?.self),
        .field("users", [User?]?.self),
      ] }

      public var cursor: Int? { __data["cursor"] }
      public var hasMore: Bool? { __data["hasMore"] }
      public var users: [User?]? { __data["users"] }

      /// Users.User
      ///
      /// Parent Type: `UserType`
      public struct User: JannahApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.UserType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", JannahApi.ID.self),
          .field("lastLogin", JannahApi.DateTime?.self),
          .field("isSuperuser", Bool.self),
          .field("username", String.self),
          .field("firstName", String.self),
          .field("lastName", String.self),
          .field("email", String.self),
          .field("isActive", Bool.self),
          .field("dateJoined", JannahApi.DateTime.self),
          .field("avatar", String.self),
          .field("bio", String?.self),
          .field("location", String?.self),
          .field("website", String?.self),
          .field("joinedDate", JannahApi.Date.self),
        ] }

        public var id: JannahApi.ID { __data["id"] }
        public var lastLogin: JannahApi.DateTime? { __data["lastLogin"] }
        /// Designates that this user has all permissions without explicitly assigning them.
        public var isSuperuser: Bool { __data["isSuperuser"] }
        /// Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
        public var username: String { __data["username"] }
        public var firstName: String { __data["firstName"] }
        public var lastName: String { __data["lastName"] }
        public var email: String { __data["email"] }
        /// Designates whether this user should be treated as active. Unselect this instead of deleting accounts.
        public var isActive: Bool { __data["isActive"] }
        public var dateJoined: JannahApi.DateTime { __data["dateJoined"] }
        public var avatar: String { __data["avatar"] }
        public var bio: String? { __data["bio"] }
        public var location: String? { __data["location"] }
        public var website: String? { __data["website"] }
        public var joinedDate: JannahApi.Date { __data["joinedDate"] }
      }
    }
  }
}
