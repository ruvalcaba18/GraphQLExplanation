// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Heroku {
  struct RocketFragment: Heroku.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment RocketFragment on Rocket { __typename id name type }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Rocket }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Heroku.ID.self),
      .field("name", String?.self),
      .field("type", String?.self),
    ] }

    var id: Heroku.ID { __data["id"] }
    var name: String? { __data["name"] }
    var type: String? { __data["type"] }
  }

}