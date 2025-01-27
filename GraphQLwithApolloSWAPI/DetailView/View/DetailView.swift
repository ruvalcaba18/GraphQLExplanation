//
//  DetailView.swift
//  GraphQLwithApolloSWAPI
//
//  Created by JaelWizeline on 22/01/25.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject private var viewModel = DetailViewModel()
    private var detailID: String = ""
    
    init(detailID: String) {
        self.detailID = detailID
    }
    
    var body: some View {
        VStack {
            
            Text("Mission site \(viewModel.launchDetails?.site ?? "")")
                .font(.title)
            
            AsyncImage(url: URL(string: viewModel.launchDetails?.mission?.missionPatch ?? "")) { image in
                HStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    VStack {
                        Text("Mission name \(viewModel.launchDetails?.mission?.name )")
                            .foregroundStyle(.teal)
                        Text("Rocket name \(viewModel.launchDetails?.rocket?.name ?? "")")
                            .foregroundStyle(.red)
                        Text("Rocket type \(viewModel.launchDetails?.rocket)")
                            .foregroundStyle(.yellow)
                        Text("Is Mission Booked \(viewModel.launchDetails?.isBooked ?? false)")
                            .foregroundStyle(.green)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 200)
                
            } placeholder: {
                ProgressView()
                    .background(.yellow)
            }
            .task {
                viewModel.fetchDetails(launchID: detailID ?? "" )
            }
            
            Button {
                viewModel.bookMission(launchID: self.detailID )
            } label: {
                Label("Book a trip!", image: "airplane.arrival")
            }
            .frame(maxWidth: .infinity,maxHeight: 50)
            .background(.green)
            .foregroundStyle(.black)
            .cornerRadius(15)
            .padding()

        }
    }
}

#Preview {
    DetailView(detailID: "1234")
}
