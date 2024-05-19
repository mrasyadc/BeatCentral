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
    @FocusState private var isFocused: Bool

    var body: some View {
        
        Button(action: {
            SoundInitializer.KICK?.playSound()
        }) {
            Text("KICK")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }.onKeyPress(.return) {
            print("Space key pressed!")
            SoundInitializer.KICK?.playSound()
            return .handled
        }
        Button(action: {
            SoundInitializer.BASS?.playSound()
        }) {
            Text("KICK")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }.onKeyPress(.space) {
            print("Space key pressed!")
            SoundInitializer.BASS?.playSound()
            return .handled
            
        }.focusable()
            .focused($isFocused)
            .onKeyPress(.return) {
                print("Return key pressed!")
                return .handled
            }
            .onKeyPress(.space) {
                print("Space key pressed!")
                return .handled
            }
            .onAppear {
                isFocused = true
            }}
        
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
