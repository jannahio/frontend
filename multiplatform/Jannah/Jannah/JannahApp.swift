//
//  JannahApp.swift
//  Jannah
//
//  Created by osman jalloh on 2/13/23.
//

import SwiftUI

@main
struct JannahApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
