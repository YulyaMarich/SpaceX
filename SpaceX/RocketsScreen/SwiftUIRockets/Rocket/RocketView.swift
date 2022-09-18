//
//  RocketView.swift
//  SpaceX
//
//  Created by Julia on 11.09.2022.
//

import SwiftUI

struct RocketView: View {
    var nameSpace: Namespace.ID
    @StateObject var viewModel: RocketViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(UIColor.sxTabBarColor)
                .matchedGeometryEffect(id: "background \(viewModel.name)", in: nameSpace)
                .cornerRadius(10)
                .frame(width: 150, height: 250)
                .offset(x: 0, y: 40)
            VStack(alignment: .leading) {
                Image(viewModel.name)
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "Image \(viewModel.name)", in: nameSpace)
                    .frame(width: 60, height: 300)
                Text(viewModel.name)
                    .font(.custom("Inter-Regular", size: 12))
                    .frame(width: 130, height: 20, alignment: .leading)
                    .matchedGeometryEffect(id: "RocketName \(viewModel.name)", in: nameSpace)
            }
            .offset(x: 20, y: -30)
        }
    }
}


