//
//  ProjectDetailsStack.swift
//  SpaceX
//
//  Created by Julia on 15.09.2022.
//

import SwiftUI

struct ProjectDetailsStack: View {
    var nameSpace: Namespace.ID
    private let variables = ["Version control system:", "Managing the distribution of code:", "Managing concurrent operations:", "Saving and storing data:", "Patterns:", "Networking:", "Frameworks:", "Animation:", "Other:"]
    private let results = ["Git", "Swift Package Manager", "Grand Central Dispatch", "UserDefaults", "MVVM, MVC", "Apollo, GraphQL", "UIKit, SwiftUI, YoutubePlayer", "Matched Geometry Effect", " Auto Layout, POP"]
    
    var body: some View {
        VStack(spacing: 15) {
            ForEach(0..<variables.count, id: \.self) { index in
                HStack {
                    HStack {
                        Spacer()
                        Text(variables[index])
                            .font(.custom("Inter-Regular", size: 12))
                            .multilineTextAlignment(.trailing)
                    }
                    Spacer()
                    
                    HStack {
                        Text(results[index])
                            .font(.custom("Inter-Regular", size: 15))
                        Spacer()
                    }
                }
            }
        }
    }
}
