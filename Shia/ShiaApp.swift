//
//  ShiaApp.swift
//  Shia
//
//  Created by Abbas on 02/06/2025.
//

import SwiftUI

@main
struct ShiaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
