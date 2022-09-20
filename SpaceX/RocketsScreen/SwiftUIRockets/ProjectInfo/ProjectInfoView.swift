//
//  ProjectInfoView.swift
//  SpaceX
//
//  Created by Julia on 13.09.2022.
//

import SwiftUI

struct ProjectInfoView: View {
    var nameSpace: Namespace.ID
    
    var body: some View {
        ZStack {
            Color(UIColor.sxTabBarColor)
                .frame(height: 100)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 0)
                .matchedGeometryEffect(id: "Background", in: nameSpace)
            VStack(alignment: .center, spacing: 10) {
                Text("Info about project")
                    .font(.custom("Inter-Regular", size: 15))
                    .frame(width: 300, height: 18)
                    .matchedGeometryEffect(id: "Info about project", in: nameSpace)
                Text("tap to see")
                    .font(.custom("Inter-Regular", size: 11))
                Text("Created by Yulia Marych")
                    .font(.custom("Inter-Regular", size: 11))
                    .frame(width: 300, height: 13)
                    .matchedGeometryEffect(id: "Created by Yulia Marych", in: nameSpace)
            }
        }
        .padding(.leading, 28).padding(.trailing, 28).padding(.bottom, 20)
    }
}
