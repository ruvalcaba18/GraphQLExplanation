//
//  ContentView.swift
//  GraphQLwithApolloSWAPI
//
//  Created by jael ruvalcaba on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FullStackHerokuViewModel()
   
    @ViewBuilder private func ListRowLaunch(_ individualFilm: Heroku.ExampleQuery.Data.Launches.Launch?) -> some View {
        
        VStack{
            
            Text(individualFilm?.site ?? "")
            
            AsyncImage(url: URL(string: individualFilm?.mission?.missionPatch ?? "")) { image in
                HStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(individualFilm?.mission?.name ?? "" )
                }
                .frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
                    .background(.yellow)
            }
        }
    }
    
    var body: some View {
        VStack {
            List{
                ForEach(viewModel.filmsToDisplay,id: \.?.id ){ individualFilm in
                    ListRowLaunch(individualFilm)
                        .onTapGesture {
                            viewModel.generateMutation(launchID: individualFilm?.id ?? "" )
                        }
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
        .onAppear {
            viewModel.fetchHerokuInformation()
        }
    }
}

#Preview {
    ContentView()
}
