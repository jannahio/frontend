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
    case "QueryNetworks": return JannahApi.Objects.QueryNetworks
    case "NetworkType": return JannahApi.Objects.NetworkType
    case "QuerySites": return JannahApi.Objects.QuerySites
    case "JannahSiteType": return JannahApi.Objects.JannahSiteType
    case "QueryBoots": return JannahApi.Objects.QueryBoots
    case "BootType": return JannahApi.Objects.BootType
    case "QueryComputes": return JannahApi.Objects.QueryComputes
    case "ComputeType": return JannahApi.Objects.ComputeType
    case "QueryUXs": return JannahApi.Objects.QueryUXs
    case "UXType": return JannahApi.Objects.UXType
    case "QueryUsers": return JannahApi.Objects.QueryUsers
    case "UserType": return JannahApi.Objects.UserType
    case "QueryWorkflows": return JannahApi.Objects.QueryWorkflows
    case "WorkflowType": return JannahApi.Objects.WorkflowType
    case "QueryFeedbacks": return JannahApi.Objects.QueryFeedbacks
    case "FeedbackType": return JannahApi.Objects.FeedbackType
    case "QueryStorages": return JannahApi.Objects.QueryStorages
    case "StorageType": return JannahApi.Objects.StorageType
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
