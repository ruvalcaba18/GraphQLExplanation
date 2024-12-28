//
//  Apollo.swift
//  GraphQLwithApolloSWAPI
//
//  Created by jael ruvalcaba on 05/12/24.
//
import Apollo
import Foundation

final class Network {
    
    static let shared = Network()
    private(set) lazy var client = ApolloClient(url: URL(string:"https://apollo-fullstack-tutorial.herokuapp.com/graphql")!)
}

