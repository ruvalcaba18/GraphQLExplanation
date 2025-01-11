// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Heroku {
  struct MissionFragment: Heroku.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment MissionFragment on Mission { __typename missionPatch(size: $size) name }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Mission }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("missionPatch", String?.self, arguments: ["size": .variable("size")]),
      .field("name", String?.self),
    ] }

    var missionPatch: String? { __data["missionPatch"] }
    var name: String? { __data["name"] }
  }

}