// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == JannahAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == JannahAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == JannahAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == JannahAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return JannahAPI.Objects.Query
    case "ComputeType": return JannahAPI.Objects.ComputeType
    case "NetworkType": return JannahAPI.Objects.NetworkType
    case "UserType": return JannahAPI.Objects.UserType
    case "UXType": return JannahAPI.Objects.UXType
    case "BootType": return JannahAPI.Objects.BootType
    case "StorageType": return JannahAPI.Objects.StorageType
    case "FeedbackType": return JannahAPI.Objects.FeedbackType
    case "JannahSiteType": return JannahAPI.Objects.JannahSiteType
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
