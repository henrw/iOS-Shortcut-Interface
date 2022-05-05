//
//  My_ShortcutsApp.swift
//  My Shortcuts
//
//  Created by Henry Wu on 4/26/22.
//

import SwiftUI

@main
struct My_ShortcutsApp: App {
    @StateObject var procedure = Procedure()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(procedure)
        }
    }
}
