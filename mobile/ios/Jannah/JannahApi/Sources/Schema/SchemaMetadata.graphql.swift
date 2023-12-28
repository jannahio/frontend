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
    case "JannahNetworks": return JannahApi.Objects.JannahNetworks
    case "NetworkType": return JannahApi.Objects.NetworkType
    case "JannahSites": return JannahApi.Objects.JannahSites
    case "SiteType": return JannahApi.Objects.SiteType
    case "JannahBoots": return JannahApi.Objects.JannahBoots
    case "BootType": return JannahApi.Objects.BootType
    case "JannahComputes": return JannahApi.Objects.JannahComputes
    case "ComputeType": return JannahApi.Objects.ComputeType
    case "JannahUXs": return JannahApi.Objects.JannahUXs
    case "UXType": return JannahApi.Objects.UXType
    case "JannahUsers": return JannahApi.Objects.JannahUsers
    case "UserType": return JannahApi.Objects.UserType
    case "JannahWorkflows": return JannahApi.Objects.JannahWorkflows
    case "WorkflowType": return JannahApi.Objects.WorkflowType
    case "JannahFeedbacks": return JannahApi.Objects.JannahFeedbacks
    case "FeedbackType": return JannahApi.Objects.FeedbackType
    case "JannahStorages": return JannahApi.Objects.JannahStorages
    case "StorageType": return JannahApi.Objects.StorageType
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
