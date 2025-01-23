// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Heroku {
  class BookTripsMutation: GraphQLMutation {
    static let operationName: String = "BookTrips"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation BookTrips($launchIds: [ID]!, $size: PatchSize) { bookTrips(launchIds: $launchIds) { __typename launches { __typename id isBooked mission { __typename ...MissionFragment } rocket { __typename ...RocketFragment } site } message success } }"#,
        fragments: [MissionFragment.self, RocketFragment.self]
      ))

    public var launchIds: [ID?]
    public var size: GraphQLNullable<GraphQLEnum<PatchSize>>

    public init(
      launchIds: [ID?],
      size: GraphQLNullable<GraphQLEnum<PatchSize>>
    ) {
      self.launchIds = launchIds
      self.size = size
    }

    public var __variables: Variables? { [
      "launchIds": launchIds,
      "size": size
    ] }

    struct Data: Heroku.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("bookTrips", BookTrips.self, arguments: ["launchIds": .variable("launchIds")]),
      ] }

      var bookTrips: BookTrips { __data["bookTrips"] }

      /// BookTrips
      ///
      /// Parent Type: `TripUpdateResponse`
      struct BookTrips: Heroku.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.TripUpdateResponse }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("launches", [Launch?]?.self),
          .field("message", String?.self),
          .field("success", Bool.self),
        ] }

        var launches: [Launch?]? { __data["launches"] }
        var message: String? { __data["message"] }
        var success: Bool { __data["success"] }

        /// BookTrips.Launch
        ///
        /// Parent Type: `Launch`
        struct Launch: Heroku.SelectionSet {
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

          /// BookTrips.Launch.Mission
          ///
          /// Parent Type: `Mission`
          struct Mission: Heroku.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Mission }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .fragment(MissionFragment.self),
            ] }

            var missionPatch: String? { __data["missionPatch"] }
            var name: String? { __data["name"] }

            struct Fragments: FragmentContainer {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              var missionFragment: MissionFragment { _toFragment() }
            }
          }

          /// BookTrips.Launch.Rocket
          ///
          /// Parent Type: `Rocket`
          struct Rocket: Heroku.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Rocket }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .fragment(RocketFragment.self),
            ] }

            var id: Heroku.ID { __data["id"] }
            var name: String? { __data["name"] }
            var type: String? { __data["type"] }

            struct Fragments: FragmentContainer {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              var rocketFragment: RocketFragment { _toFragment() }
            }
          }
        }
      }
    }
  }

}