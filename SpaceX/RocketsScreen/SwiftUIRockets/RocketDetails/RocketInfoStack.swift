//
//  RocketInfoStack.swift
//  SpaceX
//
//  Created by Julia on 11.09.2022.
//

import SwiftUI

struct RocketInfoStack: View {
    @State var variable: String
    @State var result: String
    
    var body: some View {
        ZStack {
            HStack {
                Rectangle()
                    .foregroundColor(Color(UIColor.sxRed))
                    .frame(width: 2, height: 20)
                VStack(alignment: .leading) {
                    Text(result)
                        .font(.custom("Inter-Bold", size: 11))
                    Text(variable)
                        .font(.custom("Inter-Regular", size: 8))
                }
            }
            .padding(.leading, 40)
        }
    }
}

struct RocketInfoStack_Previews: PreviewProvider {
    static var previews: some View {
        RocketInfoStack(variable: "Cost per launch", result: "$7.0M")
    }
}
