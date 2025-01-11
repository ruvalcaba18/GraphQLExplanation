//
//  ContentView.swift
//  GraphQLwithApolloSWAPI
//
//  Created by jael ruvalcaba on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: FullStackHerokuViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: FullStackHerokuViewModel())
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()

    }
}

#Preview {
    ContentView()
}
