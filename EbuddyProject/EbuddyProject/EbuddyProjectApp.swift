//
//  EbuddyProjectApp.swift
//  EbuddyProject
//
//  Created by Rasdiana Sari on 19/12/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
      FirebaseApp.configure()

    return true
  }
}

@main
struct EbuddyProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}
