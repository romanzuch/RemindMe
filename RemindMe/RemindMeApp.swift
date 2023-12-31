//
//  RemindMeApp.swift
//  RemindMe
//
//  Created by Roman Zuchowski on 07.10.23.
//

import SwiftUI
import SwiftData

@main
struct RemindMeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            RemindMeItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
