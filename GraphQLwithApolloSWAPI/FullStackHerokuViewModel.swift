//
//  StarWarsInformationViewModel.swift
//  GraphQLwithApolloSWAPI
//
//  Created by jael ruvalcaba on 06/12/24.
//

import Foundation
import Apollo

final class FullStackHerokuViewModel:ObservableObject {
    
    @Published private(set) var filmsToDisplay: [Heroku.ExampleQuery.Data.Launches.Launch?] = []
    @Published private(set) var cancelTripMutationData: Heroku.CancelTripMutation.Data.CancelTrip? = Heroku.CancelTripMutation.Data.CancelTrip(_dataDict: DataDict.init(data: [:], fulfilledFragments: []))
    @Published private(set) var bookTripMutationData: Heroku.BookTripsMutation.Data.BookTrips? = Heroku.BookTripsMutation.Data.BookTrips(_dataDict: DataDict.init(data: [:], fulfilledFragments: []))
    
        public func fetchHerokuInformation() {
            
            Network.shared.client.fetch(query: Heroku.ExampleQuery()) { [weak self] result in
           
                guard let self = self else {return }
                switch result{
                    
                case .success(let graphQLResult):
                 
                    if let resultado = graphQLResult.data?.launches.launches {
                        self.filmsToDisplay.append( contentsOf: resultado)
                        print("Succes result \(resultado)")
                        print("Mission result \(resultado.first??.mission)")
                    }
                    
                    if let errors = graphQLResult.errors {
                        print(errors)
                    }
                  
                case .failure(let error):
                    print("we have an error \(error.localizedDescription)")
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
}
