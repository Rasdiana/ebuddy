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
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: UserView()) {
                    Label("User", systemImage: "app.badge")
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
