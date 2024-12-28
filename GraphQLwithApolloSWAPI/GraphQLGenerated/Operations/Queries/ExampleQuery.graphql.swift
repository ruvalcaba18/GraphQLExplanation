// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Heroku {
  class ExampleQuery: GraphQLQuery {
    static let operationName: String = "ExampleQuery"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query ExampleQuery { me { __typename email id profileImage token trips { __typename ...trips } } launches { __typename hasMore launches { __typename id isBooked mission { __typename ...missions } rocket { __typename ...smallRocker } site } cursor } totalTripsBooked }"#,
        fragments: [Missions.self, SmallRocker.self, Trips.self]
      ))

    public init() {}

    struct Data: Heroku.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("me", Me?.self),
        .field("launches", Launches.self),
        .field("totalTripsBooked", Int?.self),
      ] }

      var me: Me? { __data["me"] }
      var launches: Launches { __data["launches"] }
      var totalTripsBooked: Int? { __data["totalTripsBooked"] }

      /// Me
      ///
      /// Parent Type: `User`
      struct Me: Heroku.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("email", String.self),
          .field("id", Heroku.ID.self),
          .field("profileImage", String?.self),
          .field("token", String?.self),
          .field("trips", [Trip?].self),
        ] }

        var email: String { __data["email"] }
        var id: Heroku.ID { __data["id"] }
        var profileImage: String? { __data["profileImage"] }
        var token: String? { __data["token"] }
        var trips: [Trip?] { __data["trips"] }

        /// Me.Trip
        ///
        /// Parent Type: `Launch`
        struct Trip: Heroku.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Launch }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(Trips.self),
          ] }

          var id: Heroku.ID { __data["id"] }
          var isBooked: Bool { __data["isBooked"] }
          var mission: Mission? { __data["mission"] }
          var rocket: Rocket? { __data["rocket"] }
          var site: String? { __data["site"] }

          struct Fragments: FragmentContainer {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            var trips: Trips { _toFragment() }
          }

          typealias Mission = Trips.Mission

          typealias Rocket = Trips.Rocket
        }
      }

      /// Launches
      ///
      /// Parent Type: `LaunchConnection`
      struct Launches: Heroku.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.LaunchConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("hasMore", Bool.self),
          .field("launches", [Launch?].self),
          .field("cursor", String.self),
        ] }

        var hasMore: Bool { __data["hasMore"] }
        var launches: [Launch?] { __data["launches"] }
        var cursor: String { __data["cursor"] }

        /// Launches.Launch
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

          /// Launches.Launch.Mission
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

          /// Launches.Launch.Rocket
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
    }
  }

}