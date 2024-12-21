//
//  ContentView.swift
//  EbuddyProject
//
//  Created by Rasdiana Sari on 19/12/24.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var flag1: Int = 1
    @State var flag2: Int = 2
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: UserView(flag: flag1)) {
                    Label("User", systemImage: "app.badge")
                }
                NavigationLink(destination: UserView(flag: flag2)) {
                    Label("User Multiple Queries", systemImage: "app.badge")
                }
                NavigationLink(destination: FigmaView()) {
                    Label("Figma", systemImage: "app.badge")
                }
                
            }
        }
    }
    
    
}

#Preview {
    //CHANGE TO LIGHT
    //COMMIT 8
    ContentView().preferredColorScheme(.dark)
}
