//
//  AuthorizationInterceptor.swift
//  GraphQLwithApolloSWAPI
//
//  Created by JaelWizeline on 21/01/25.
//

import Foundation
import ApolloAPI
import Apollo

class AuthorizationInterceptor: ApolloInterceptor {
    
    var id: String = UUID().uuidString
    let loginKey = "loginToken"
    private var storedDefaults = UserDefaults()
    
    func interceptAsync<Operation>(chain: any Apollo.RequestChain, request: Apollo.HTTPRequest<Operation>, response: Apollo.HTTPResponse<Operation>?, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, any Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {
        
        if let token = storedDefaults.string(forKey: loginKey) {
            request.addHeader(name: "Authorization", value: token)
        }
        chain.proceedAsync(request: request,
                           response: response,
                           interceptor: self,
                           completion: completion)
    }
    
    
}
