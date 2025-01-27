// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Heroku {
  class LaunchDetailsQuery: GraphQLQuery {
    static let operationName: String = "LaunchDetails"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query LaunchDetails($launchId: ID!) { launch(id: $launchId) { __typename isBooked site id rocket { __typename name } mission { __typename missionPatch name } } me { __typename email } }"#
      ))

    public var launchId: ID

    public init(launchId: ID) {
      self.launchId = launchId
    }

    public var __variables: Variables? { ["launchId": launchId] }

    struct Data: Heroku.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("launch", Launch?.self, arguments: ["id": .variable("launchId")]),
        .field("me", Me?.self),
      ] }

      var launch: Launch? { __data["launch"] }
      var me: Me? { __data["me"] }

      /// Launch
      ///
      /// Parent Type: `Launch`
      struct Launch: Heroku.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Launch }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("isBooked", Bool.self),
          .field("site", String?.self),
          .field("id", Heroku.ID.self),
          .field("rocket", Rocket?.self),
          .field("mission", Mission?.self),
        ] }

        var isBooked: Bool { __data["isBooked"] }
        var site: String? { __data["site"] }
        var id: Heroku.ID { __data["id"] }
        var rocket: Rocket? { __data["rocket"] }
        var mission: Mission? { __data["mission"] }

        /// Launch.Rocket
        ///
        /// Parent Type: `Rocket`
        struct Rocket: Heroku.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Rocket }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String?.self),
          ] }

          var name: String? { __data["name"] }
        }

        /// Launch.Mission
        ///
        /// Parent Type: `Mission`
        struct Mission: Heroku.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Mission }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("missionPatch", String?.self),
            .field("name", String?.self),
          ] }

          var missionPatch: String? { __data["missionPatch"] }
          var name: String? { __data["name"] }
        }
      }

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
        ] }

        var email: String { __data["email"] }
      }
    }
  }

}