//
//  ContentView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 14/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        Button(action: {
            SoundInitializer.KICK?.playSound()
            print(SoundInitializer.KICK?.isPlaying())
        }) {
            Text("KICK")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        Button(action: {
            SoundInitializer.BASS?.playSound()
        }) {
            Text("BASS")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
