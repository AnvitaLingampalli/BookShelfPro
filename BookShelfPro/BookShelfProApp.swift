//
//  BookShelfProApp.swift
//  BookShelfPro
//
//  Created by Anvita Lingampalli on 3/17/23.
//

import SwiftUI

@main
struct BookShelfProApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
