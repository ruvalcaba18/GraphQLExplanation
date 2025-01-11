// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Heroku {
  class LoginMutation: GraphQLMutation {
    static let operationName: String = "Login"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation Login($email: String, $size: PatchSize) { login(email: $email) { __typename email id token profileImage trips { __typename ...TripsFragment } } }"#,
        fragments: [MissionFragment.self, RocketFragment.self, TripsFragment.self]
      ))

    public var email: GraphQLNullable<String>
    public var size: GraphQLNullable<GraphQLEnum<PatchSize>>

    public init(
      email: GraphQLNullable<String>,
      size: GraphQLNullable<GraphQLEnum<PatchSize>>
    ) {
      self.email = email
      self.size = size
    }

    public var __variables: Variables? { [
      "email": email,
      "size": size
    ] }

    struct Data: Heroku.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("login", Login?.self, arguments: ["email": .variable("email")]),
      ] }

      var login: Login? { __data["login"] }

      /// Login
      ///
      /// Parent Type: `User`
      struct Login: Heroku.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("email", String.self),
          .field("id", Heroku.ID.self),
          .field("token", String?.self),
          .field("profileImage", String?.self),
          .field("trips", [Trip?].self),
        ] }

        var email: String { __data["email"] }
        var id: Heroku.ID { __data["id"] }
        var token: String? { __data["token"] }
        var profileImage: String? { __data["profileImage"] }
        var trips: [Trip?] { __data["trips"] }

        /// Login.Trip
        ///
        /// Parent Type: `Launch`
        struct Trip: Heroku.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Launch }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(TripsFragment.self),
          ] }

          var id: Heroku.ID { __data["id"] }
          var isBooked: Bool { __data["isBooked"] }
          var mission: Mission? { __data["mission"] }
          var rocket: Rocket? { __data["rocket"] }
          var site: String? { __data["site"] }

          struct Fragments: FragmentContainer {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            var tripsFragment: TripsFragment { _toFragment() }
          }

          typealias Mission = TripsFragment.Mission

          typealias Rocket = TripsFragment.Rocket
        }
      }
    }
  }

}