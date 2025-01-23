//
//  ContentView.swift
//  GraphQLwithApolloSWAPI
//
//  Created by jael ruvalcaba on 05/12/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
   
    @ViewBuilder private func ListRowLaunch(_ individualFilm: Heroku.ExampleQuery.Data.Launches.Launch?) -> some View {
        
        NavigationLink(destination: DetailView(detailID: individualFilm?.id ?? "")) {
            VStack {
              
                Text("Mission site \(individualFilm?.site ?? "")")
                    .font(.title)
                Text("Mission id \(individualFilm?.id ?? "")")
                    .font(.subheadline)

                AsyncImage(url: URL(string: individualFilm?.mission?.missionPatch ?? "")) { image in
                    HStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)

                        VStack {
                            Text("Mission name \(individualFilm?.mission?.name ?? "")")
                                .foregroundStyle(.teal)
                            Text("Rocket name \(individualFilm?.rocket?.name ?? "")")
                                .foregroundStyle(.red)
                            Text("Rocket type \(individualFilm?.rocket?.type ?? "")")
                                .foregroundStyle(.yellow)
                            Text("Is Mission Booked \(individualFilm?.isBooked ?? false)")
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
    }

    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(viewModel.filmsToDisplay ,id: \.id ) { individualFilm in
                        ListRowLaunch(individualFilm)
                    }
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            }
            .onAppear {
                viewModel.fetchHerokuInformation()
                viewModel.startLogin(withEmail: "jael.ruvalcaba@uabc.edu.mx")
            }
        }
    }
}

#Preview {
    LoginView()
}
