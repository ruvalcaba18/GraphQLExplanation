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
    @Published var appAlert: AnyObject?
    
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
    
    func generateMutation(launchID: Heroku.ID) {
        
        Network.shared.client.perform(mutation: Heroku.CancelTripMutation(launchId: launchID, size: .some(.case(.small)))) { result in
            guard let data = try? result.get().data else {
                return
            }
            
            print("Somethign to know ",data.__data._data)
            print("Success mutation" ,data.cancelTrip)
        }
    }
}
