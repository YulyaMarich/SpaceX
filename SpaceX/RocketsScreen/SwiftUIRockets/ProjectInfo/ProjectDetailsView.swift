//
//  ProjectDetailsView.swift
//  SpaceX
//
//  Created by Julia on 15.09.2022.
//

import SwiftUI

struct ProjectDetailsView: View {
    var nameSpace: Namespace.ID
    @Binding var showProjectDetails: Bool
    private let links = ["https://github.com/YulyaMarich/XSpace.git", "https://api.spacex.land/graphql/"]
    
    var body: some View {
        ZStack {
            Color(UIColor.sxTabBarColor)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 0)
                .matchedGeometryEffect(id: "Background", in: nameSpace)
            VStack {
                VStack(alignment: .center, spacing: 12) {
                    Text("SpaceX")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color(UIColor.sxRed))
                    Text("Info about project")
                        .font(.largeTitle.bold())
                        .frame(width: 300, height: 40)
                        .matchedGeometryEffect(id: "Info about project", in: nameSpace)
                    Rectangle()
                        .frame(height: 6)
                        .foregroundColor(Color(UIColor.sxRed))
                    ProjectDetailsStack(nameSpace: nameSpace)
                        .padding(.top, 20)
                    Spacer()
                }
                .padding()
                VStack(spacing: 15) {
                    VStack {
                        ForEach(0..<links.count, id: \.self) { index in
                            if let url = URL(string: links[index]) {
                                Link(destination: url) {
                                    Text(links[index])
                                        .underline()
                                        .accentColor(Color(UIColor.sxBlack))
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                    Text("Created by Yulia Marych")
                        .font(.footnote.weight(.semibold))
                        .padding(.bottom)
                        .frame(width: 300, height: 13)
                        .matchedGeometryEffect(id: "Created by Yulia Marych", in: nameSpace)
                }
            }
        }
        .padding()
        .background(Color(UIColor.sxWhite))
        Button {
            withAnimation(.spring()) {
                showProjectDetails.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(Color(UIColor.sxBlack))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.top, 40)
        .padding(.leading, 40)
    }
}
