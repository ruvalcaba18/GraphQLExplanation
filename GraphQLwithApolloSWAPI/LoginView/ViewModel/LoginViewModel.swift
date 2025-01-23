//
//  StarWarsInformationViewModel.swift
//  GraphQLwithApolloSWAPI
//
//  Created by jael ruvalcaba on 06/12/24.
//

import Foundation
import Apollo


final class LoginViewModel:ObservableObject {
    
    @Published private(set) var filmsToDisplay: [Heroku.ExampleQuery.Data.Launches.Launch] = []
    private var storedDefaults = UserDefaults()
    
    init() {
        startSubscription()
    }
    
    var activeSubscription: Cancellable?
    
        public func fetchHerokuInformation() {
            
            Network.shared.client.fetch(query: Heroku.ExampleQuery()) { [weak self] result in
           
                guard let self = self else {return }
                switch result{
                    
                case .success(let graphQLResult):
                 
                    if let resultado = graphQLResult.data?.launches.launches {
                        self.filmsToDisplay = resultado.compactMap { $0}
                    }
                    
                    if let errors = graphQLResult.errors {
                        print("Fetch query errors \(errors)")
                    }
                  
                case .failure(let error):
                    print("we have an error \(error.localizedDescription)")
                }
        }
    }
    
    func startSubscription() {
        
        activeSubscription = Network.shared.client.subscribe(subscription: Heroku.TripsSubscription()) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let tripsBooked = graphQLResult.data?.tripsBooked {
                    print(" Trips booked \(tripsBooked)")
                }

                if let errors = graphQLResult.errors {
                    print(" Trips booked errors \(errors)")
                }
            case .failure(let error):
                print(" Trips booked error in handler \(error)")
            }
        }
    }
    
    func startLogin(withEmail email: String) {
        Network.shared.client.perform(mutation: Heroku.LoginMutation(email: email)) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result{
            case .success(let success):
                if let correctLogin = success.data?.login {
                    self.storedDefaults.set(correctLogin.token, forKey: "loginToken")
                    print("Setted Token \(correctLogin.token)")
                }
                
                if let errors = success.errors {
                    print("Errors for login \(errors)")
                }
                
            case .failure(let failure):
                print("Failure error \(failure)")
            }
        }
    }
    
}
