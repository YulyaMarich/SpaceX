//
//  RocketDetails.swift
//  SpaceX
//
//  Created by Julia on 11.09.2022.
//

import SwiftUI

struct RocketDetails: View {
    var nameSpace: Namespace.ID
    @Binding var show: Bool
    @StateObject var viewModel: RocketDetailsViewModel
    
    var body: some View {
        ZStack {
            Color(UIColor.sxWhite)
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 25) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(viewModel.name)
                                .font(.custom("Inter-Bold", size: 20))
                                .frame(width: 150, height: 20, alignment: .leading)
                                .matchedGeometryEffect(id: "RocketName \(viewModel.name)", in: nameSpace)
                            Text(viewModel.description)
                                .font(.custom("Inter-Regular", size: 12))
                        }
                        .frame(width: 150)
                        .padding(.all, 20)
                        .background(Color(UIColor.sxTabBarColor)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 0)
                            .matchedGeometryEffect(id: "background \(viewModel.name)", in: nameSpace))
                        .padding(.leading, 20)
                        VStack(alignment: .leading) {
                            ForEach(0..<viewModel.variables.count, id: \.self) { index in
                                RocketInfoStack(variable: viewModel.variables[index], result: viewModel.results[index])
                            }
                        }
                        Spacer()
                    }
                    VStack {
                        Image(viewModel.name)
                            .resizable()
                            .scaledToFit()
                            .shadow(color: Color(UIColor.gray).opacity(0.3), radius: 4, x: 0, y: 0)
                            .matchedGeometryEffect(id: "Image \(viewModel.name)", in: nameSpace)
                            .frame(width: 86, height: 450)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 20)
                        Spacer()
                    }
                }
                .padding(.top, 45)
                Spacer()
            }
            Button {
                withAnimation(.spring()) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(UIColor.sxBlack))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 20)
            .padding(.leading, 20)
        }
    }
}
