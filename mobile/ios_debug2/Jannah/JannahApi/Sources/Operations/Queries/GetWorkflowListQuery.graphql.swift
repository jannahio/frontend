// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetWorkflowListQuery: GraphQLQuery {
  public static let operationName: String = "getWorkflowList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query getWorkflowList {
        allSites {
          __typename
          id
          name
          description
          logo
        }
        allUsers {
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
        allBoots {
          __typename
          id
          name
          slug
          description
        }
        allNetworks {
          __typename
          id
          name
          slug
          description
        }
        allStorages {
          __typename
          id
          name
          slug
          description
        }
        allComputes {
          __typename
          id
          name
          slug
          description
        }
        allUxs {
          __typename
          id
          name
          slug
          description
        }
        allFeedbacks {
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
      .field("allSites", [AllSite?]?.self),
      .field("allUsers", [AllUser?]?.self),
      .field("allBoots", [AllBoot?]?.self),
      .field("allNetworks", [AllNetwork?]?.self),
      .field("allStorages", [AllStorage?]?.self),
      .field("allComputes", [AllCompute?]?.self),
      .field("allUxs", [AllUx?]?.self),
      .field("allFeedbacks", [AllFeedback?]?.self),
    ] }

    public var allSites: [AllSite?]? { __data["allSites"] }
    public var allUsers: [AllUser?]? { __data["allUsers"] }
    public var allBoots: [AllBoot?]? { __data["allBoots"] }
    public var allNetworks: [AllNetwork?]? { __data["allNetworks"] }
    public var allStorages: [AllStorage?]? { __data["allStorages"] }
    public var allComputes: [AllCompute?]? { __data["allComputes"] }
    public var allUxs: [AllUx?]? { __data["allUxs"] }
    public var allFeedbacks: [AllFeedback?]? { __data["allFeedbacks"] }

    /// AllSite
    ///
    /// Parent Type: `JannahSiteType`
    public struct AllSite: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.JannahSiteType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", JannahApi.ID.self),
        .field("name", String.self),
        .field("description", String.self),
        .field("logo", String.self),
      ] }

      public var id: JannahApi.ID { __data["id"] }
      public var name: String { __data["name"] }
      public var description: String { __data["description"] }
      public var logo: String { __data["logo"] }
    }

    /// AllUser
    ///
    /// Parent Type: `UserType`
    public struct AllUser: JannahApi.SelectionSet {
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

    /// AllNetwork
    ///
    /// Parent Type: `NetworkType`
    public struct AllNetwork: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.NetworkType }
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

    /// AllStorage
    ///
    /// Parent Type: `StorageType`
    public struct AllStorage: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.StorageType }
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

    /// AllCompute
    ///
    /// Parent Type: `ComputeType`
    public struct AllCompute: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.ComputeType }
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

    /// AllUx
    ///
    /// Parent Type: `UXType`
    public struct AllUx: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.UXType }
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

    /// AllFeedback
    ///
    /// Parent Type: `FeedbackType`
    public struct AllFeedback: JannahApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JannahApi.Objects.FeedbackType }
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
