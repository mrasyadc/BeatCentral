//
//  BeatCentralApp.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 14/05/24.
//

import SwiftUI
import SwiftData

@main
struct BeatCentralApp: App {
    @StateObject var keyboardObserver = KeyboardObserver()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
//            KeyboardView(detector: KeyboardManager.spaceDetector)
            KeyboardNewView().environmentObject(keyboardObserver)
        }
        .modelContainer(sharedModelContainer)
    }
}
