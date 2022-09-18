//
//  RocketsViewController.swift
//  SpaceX
//
//  Created by Julia on 06.09.2022.
//

import SwiftUI

struct RocketsView: View {
    @Namespace var nameSpace
    @State var showRocketDetails = false
    @State var showProjectDetails = false
    @State var selected: RocketsQuery.Data.Rocket?
    var rockets = [RocketsQuery.Data.Rocket?]()
    
    init(passedRockets: [RocketsQuery.Data.Rocket?]) {
        self.rockets = passedRockets
    }
    
    var body: some View {
        ZStack {
            VStack {
                if UIScreen.main.bounds.height < 750 {
                    rocketsTitle
                        .padding(.leading)
                } else {
                    rocketsTitle
                        .padding(.leading, 20)
                }
                ZStack {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 20) {
                                if let rockets = rockets {
                                    ForEach(rockets, id: \.?.name) { rocket in
                                        RocketView(nameSpace: nameSpace, viewModel: RocketViewModel(data: rocket))
                                            .onTapGesture {
                                                withAnimation(.spring()) {
                                                    selected = rocket
                                                    showRocketDetails.toggle()
                                                }
                                            }
                                    }
                                }
                            }
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 0)
                            .frame(height: 350)
                            .padding(.trailing, 20)
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        }
                        
                        Spacer()
                        
                        ProjectInfoView(nameSpace: nameSpace)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    showProjectDetails.toggle()
                                }
                            }
                    }
                }
            }
            if showRocketDetails {
                RocketDetails(nameSpace: nameSpace, show: $showRocketDetails, viewModel: RocketDetailsViewModel(data: selected))
            }
            if showProjectDetails {
                ProjectDetailsView(nameSpace: nameSpace, showProjectDetails: $showProjectDetails)
            }
        }
        .onDisappear {
            showRocketDetails = false
            showProjectDetails = false
        }
    }
    
    var rocketsTitle: some View {
        VStack {
            Spacer()
            HStack {
                Text("Rockets")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(UIColor.sxRed))
                Spacer()
            }
        }
        .frame(height: 88)
    }
}

