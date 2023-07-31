// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == JannahApi.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == JannahApi.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == JannahApi.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == JannahApi.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return JannahApi.Objects.Query
    case "BootType": return JannahApi.Objects.BootType
    case "JannahSiteType": return JannahApi.Objects.JannahSiteType
    case "UserType": return JannahApi.Objects.UserType
    case "NetworkType": return JannahApi.Objects.NetworkType
    case "StorageType": return JannahApi.Objects.StorageType
    case "ComputeType": return JannahApi.Objects.ComputeType
    case "UXType": return JannahApi.Objects.UXType
    case "FeedbackType": return JannahApi.Objects.FeedbackType
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
