//
//  GuessTheFlagApp.swift
//  GuessTheFlag
//
//  Created by Afga Ghifari on 02/04/26.
//

import SwiftUI

@main
struct GuessTheFlagApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
     // Large Navigation Title
     UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
     // Inline Navigation Title
     UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
   }
}
