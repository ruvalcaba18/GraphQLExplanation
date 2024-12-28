//
//  StarWarsInformationViewModel.swift
//  GraphQLwithApolloSWAPI
//
//  Created by jael ruvalcaba on 06/12/24.
//

import Foundation
import Apollo

final class StarWarsInformationViewModel:ObservableObject {
    
    private(set) var filmsToDisplay: [Heroku.LaunchListQuery.Data.Launches] = []
    init() {
        Network.shared.client.fetch(query: Heroku.LaunchListQuery()) { [weak self] result in
            guard let self = self else {return }
            switch result{
                
            case .success(let graphQLResult):
             
                let resultado = graphQLResult.data?.launches
                self.filmsToDisplay.append( resultado!)
                print("Succes result \(resultado )")
            case .failure(let error):
                print("we have an error \(error.localizedDescription)")
            }
            
        }
    }
}