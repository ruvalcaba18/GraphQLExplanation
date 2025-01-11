// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Heroku {
  class CancelTripMutation: GraphQLMutation {
    static let operationName: String = "CancelTrip"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation CancelTrip($launchId: ID!, $size: PatchSize) { cancelTrip(launchId: $launchId) { __typename launches { __typename id isBooked mission { __typename ...MissionFragment } } message success } }"#,
        fragments: [MissionFragment.self]
      ))

    public var launchId: ID
    public var size: GraphQLNullable<GraphQLEnum<PatchSize>>

    public init(
      launchId: ID,
      size: GraphQLNullable<GraphQLEnum<PatchSize>>
    ) {
      self.launchId = launchId
      self.size = size
    }

    public var __variables: Variables? { [
      "launchId": launchId,
      "size": size
    ] }

    struct Data: Heroku.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("cancelTrip", CancelTrip.self, arguments: ["launchId": .variable("launchId")]),
      ] }

      var cancelTrip: CancelTrip { __data["cancelTrip"] }

      /// CancelTrip
      ///
      /// Parent Type: `TripUpdateResponse`
      struct CancelTrip: Heroku.SelectionSet {
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

        /// CancelTrip.Launch
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
          ] }

          var id: Heroku.ID { __data["id"] }
          var isBooked: Bool { __data["isBooked"] }
          var mission: Mission? { __data["mission"] }

          /// CancelTrip.Launch.Mission
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
        }
      }
    }
  }

}