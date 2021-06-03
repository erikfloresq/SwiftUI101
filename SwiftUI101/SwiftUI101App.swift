//
//  SwiftUI101App.swift
//  SwiftUI101
//
//  Created by Erik Flores on 29/5/21.
//

import SwiftUI

@main
struct SwiftUI101App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
