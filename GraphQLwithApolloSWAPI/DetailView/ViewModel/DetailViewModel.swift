//
//  DetailViewModel.swift
//  GraphQLwithApolloSWAPI
//
//  Created by JaelWizeline on 22/01/25.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published private(set) var cancelTripMutationData: Heroku.CancelTripMutation.Data.CancelTrip? = Heroku.CancelTripMutation.Data.CancelTrip(_dataDict: DataDict.init(data: [:], fulfilledFragments: []) )
    @Published private(set) var bookTripMutationData: Heroku.BookTripsMutation.Data.BookTrips? = Heroku.BookTripsMutation.Data.BookTrips(_dataDict: DataDict.init(data: [:], fulfilledFragments: []))
    
    @Published private(set) var launchDetails: Heroku.LaunchDetailsQuery.Data.Launch? = Heroku.LaunchDetailsQuery.Data.Launch(_dataDict: DataDict.init(data: [:], fulfilledFragments: []) )
    
    func fetchDetails(launchID: Heroku.ID) {
        Network.shared.client.fetch(query: Heroku.LaunchDetailsQuery(launchId: launchID)) { [weak self] result in
            
            switch result {
            case .success(let success):
                
                if let success = success.data?.launch {
                    print("Success data for now in detail \(success)")
                }
                
                if let errors = success.errors {
                    print("errors for now in detail \(errors.first?.localizedDescription)")
                }
                
            case .failure(let failure):
                print("Fetch detail failure \(failure)")
            }
        }
    }
    
    func cancelTrip(launchID: Heroku.ID) {
        
        Network.shared.client.perform(mutation: Heroku.CancelTripMutation(launchId: launchID, size: .some(.case(.small)))) { [weak self ] result in
            guard let data = try? result.get().data else {
                return
            }
            switch result {
                
            case .success( let data):
                let succes = data.data?.cancelTrip
                print("Success mutation" ,succes)
                self?.cancelTripMutationData = succes
            case .failure(let error ):
                print("errors \(error.localizedDescription)")
            }
        }
    }
    
    func bookMission(launchID: Heroku.ID?) {
        Network.shared.client.perform(mutation: Heroku.BookTripsMutation(launchIds: [launchID], size: .some(.case(.small)))) {  bookTrip in
            
            switch bookTrip {
                
            case .success(let data):
                if let succes = data.data?.bookTrips{
                    
                    print("Success mutation" , succes)
                }
                
                if let errors = data.errors {
                    print("Success errors" , errors)
                }
            case .failure(let error):
                print(error)
                break
            }
            
        }
    }
    
}
