//
//  BeatCentralApp.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 14/05/24.
//

import SwiftData
import SwiftUI

@main
struct BeatCentralApp: App {
    var body: some Scene {
        WindowGroup {
            MenuView()
                .frame(width: 1072, height: 745)

        }.windowResizabilityContentSize()
    }
}

extension Scene {
    func windowResizabilityContentSize() -> some Scene {
        if #available(macOS 13.0, *) {
            return windowResizability(.contentSize)
        } else {
            return self
        }
    }
}
