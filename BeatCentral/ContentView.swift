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
    @State private var isKeyboardVisible = false

    var body: some View {
                VStack {
                    Text("Keyboard is \(isKeyboardVisible ? "Visible" : "Hidden")")
                        .padding()
                    
                    TextField("Type something...", text: .constant(""))
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
            
                
            }
    
    }

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
