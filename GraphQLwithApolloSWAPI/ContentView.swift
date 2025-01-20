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
            
            Text("Mission site \(individualFilm?.site ?? "" )")
                .font(.title)
            
            AsyncImage(url: URL(string: individualFilm?.mission?.missionPatch ?? "")) { image in
                HStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150,height: 150)
                    
                    VStack{
                        Text("Mission name \(individualFilm?.mission?.name ?? "" ) ")
                            .foregroundStyle(.teal)
                        Text("Rocket name \(individualFilm?.rocket?.name ?? "" )")
                            .foregroundStyle(.red)
                        Text("Rocket type \(individualFilm?.rocket?.type ?? "" )")
                            .foregroundStyle(.yellow)
                        Text("Is Mission  Booket \(individualFilm?.isBooked ?? false )")
                            .foregroundStyle(.green)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 200)
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
                    .swipeActions(edge: .trailing, allowsFullSwipe: false){
                        
                        Button(role: .none) {
                            viewModel.cancelTrip(launchID: individualFilm?.id ?? "" )
                         } label: {
                             Label("Cancel trip", systemImage: "trash.fill")
                         }.tint(.yellow)
                      
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
