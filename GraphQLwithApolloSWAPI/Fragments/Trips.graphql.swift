// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Heroku {
  struct Trips: Heroku.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment trips on Launch { __typename id isBooked mission { __typename ...missions } rocket { __typename ...smallRocker } site }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Launch }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Heroku.ID.self),
      .field("isBooked", Bool.self),
      .field("mission", Mission?.self),
      .field("rocket", Rocket?.self),
      .field("site", String?.self),
    ] }

    var id: Heroku.ID { __data["id"] }
    var isBooked: Bool { __data["isBooked"] }
    var mission: Mission? { __data["mission"] }
    var rocket: Rocket? { __data["rocket"] }
    var site: String? { __data["site"] }

    /// Mission
    ///
    /// Parent Type: `Mission`
    struct Mission: Heroku.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Mission }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(Missions.self),
      ] }

      var missionPatch: String? { __data["missionPatch"] }
      var name: String? { __data["name"] }

      struct Fragments: FragmentContainer {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        var missions: Missions { _toFragment() }
      }
    }

    /// Rocket
    ///
    /// Parent Type: `Rocket`
    struct Rocket: Heroku.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Rocket }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(SmallRocker.self),
      ] }

      var id: Heroku.ID { __data["id"] }
      var name: String? { __data["name"] }
      var type: String? { __data["type"] }

      struct Fragments: FragmentContainer {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        var smallRocker: SmallRocker { _toFragment() }
      }
    }
  }

}