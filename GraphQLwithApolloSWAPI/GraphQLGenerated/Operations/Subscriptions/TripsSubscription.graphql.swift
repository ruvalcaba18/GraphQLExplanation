// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Heroku {
  class TripsSubscription: GraphQLSubscription {
    static let operationName: String = "TripsSubscription"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"subscription TripsSubscription { tripsBooked }"#
      ))

    public init() {}

    struct Data: Heroku.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { Heroku.Objects.Subscription }
      static var __selections: [ApolloAPI.Selection] { [
        .field("tripsBooked", Int?.self),
      ] }

      var tripsBooked: Int? { __data["tripsBooked"] }
    }
  }

}