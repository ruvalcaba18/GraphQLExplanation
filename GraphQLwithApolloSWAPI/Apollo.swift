//
//  Apollo.swift
//  GraphQLwithApolloSWAPI
//
//  Created by jael ruvalcaba on 05/12/24.
//
import Apollo
import Foundation
import ApolloWebSocket

final class Network {
    
    static let shared = Network()
    private(set) lazy var client: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)

        let webSocket = WebSocket(
            url: URL(string: "wss://apollo-fullstack-tutorial.herokuapp.com/graphql")!,
            protocol: .graphql_ws)

        let webSocketTransport = WebSocketTransport(websocket: webSocket)

        let splitTransport = SplitNetworkTransport(
            uploadingNetworkTransport: transport,
            webSocketNetworkTransport: webSocketTransport)

        return ApolloClient(networkTransport: splitTransport, store: store)
    }()
    
}

