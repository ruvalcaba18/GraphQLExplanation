// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol Heroku_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Heroku.SchemaMetadata {}

protocol Heroku_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Heroku.SchemaMetadata {}

protocol Heroku_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Heroku.SchemaMetadata {}

protocol Heroku_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Heroku.SchemaMetadata {}

extension Heroku {
  typealias SelectionSet = Heroku_SelectionSet

  typealias InlineFragment = Heroku_InlineFragment

  typealias MutableSelectionSet = Heroku_MutableSelectionSet

  typealias MutableInlineFragment = Heroku_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Launch": return Heroku.Objects.Launch
      case "LaunchConnection": return Heroku.Objects.LaunchConnection
      case "Mission": return Heroku.Objects.Mission
      case "Mutation": return Heroku.Objects.Mutation
      case "Query": return Heroku.Objects.Query
      case "Rocket": return Heroku.Objects.Rocket
      case "TripUpdateResponse": return Heroku.Objects.TripUpdateResponse
      case "User": return Heroku.Objects.User
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}