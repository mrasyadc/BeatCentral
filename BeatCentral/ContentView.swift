//
//  ContentView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 14/05/24.
//

import SwiftData
import SwiftUI

struct Drum {
    var isHihatOpenPressed = false
    var isHihatPressed = false
    var isSnarePressed = false
    var isKickPressed = false
    var isTomHighPressed = false
    var isTomLowPressed = false
    var isFloorTomPressed = false
    var isCrashPressed = false
    var isRidePressed = false

    mutating func setAllFalse() {
        isHihatOpenPressed = false
        isHihatPressed = false
        isSnarePressed = false
        isKickPressed = false
        isTomHighPressed = false
        isTomLowPressed = false
        isFloorTomPressed = false
        isCrashPressed = false
        isRidePressed = false
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @FocusState var isFocused: Bool
    @State private var drumState = Drum()
    var body: some View {
//        Empty Text is used as focuseable view
        KeyMapView(isFocused: $isFocused, drumState: $drumState)

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
        if drumState.isKickPressed {
        } else {
            Button(action: {
                SoundInitializer.SNARE?.playSound()
            }) {
                Text("KICK")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.onKeyPress(.space) {
                print("Space key pressed!")
                SoundInitializer.SNARE?.playSound()
                return .handled
            }
        }

        Text(String(drumState.isKickPressed))

        // figma
        VStack(alignment: .center, spacing: 136) { HStack(alignment: .top, spacing: 136) { Rectangle()
                .foregroundColor(.clear)
                .frame(width: 350, height: 178)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(350)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 350, height: 178)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(350)
        }
        .padding(0)
        HStack(alignment: .top, spacing: 136) { Rectangle()
            .foregroundColor(.clear)
            .frame(width: 350, height: 178)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(350)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 350, height: 178)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(350)
        }
        .padding(0)
        }
        .padding(.horizontal, 118)
        .padding(.vertical, 144)
        .frame(width: 1072, height: 745, alignment: .center)
        .background(.white)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
