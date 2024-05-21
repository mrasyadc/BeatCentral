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
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @FocusState private var isFocused: Bool
    @State private var drumState = Drum()
    var body: some View {
//        Empty Text is used as focuseable view
        Text("").focusable()
            .focused($isFocused)
            .onKeyPress(.return) {
                print("Return key pressed!")
                return .handled
            }
            .onKeyPress(phases: .down, action: { keyPress in
                print("""
                    New key event:
                    Key: \(keyPress.characters)
                    Modifiers: \(keyPress.modifiers)
                    Phase: \(keyPress.phase)
                    Debug description: \(keyPress.debugDescription)
                """)
                switch keyPress.characters {
                case "z":
                    SoundInitializer.HIHATOPEN?.playSound()
                case "x":
                    SoundInitializer.HIHAT?.playSound()
                case "v":
                    SoundInitializer.SNARE?.playSound()
                case "b":
                    SoundInitializer.KICK?.playSound()
                case "g":
                    SoundInitializer.TOMHIGH?.playSound()
                case "h":
                    SoundInitializer.TOMLOW?.playSound()
                case "j":
                    SoundInitializer.FLOORTOM?.playSound()
                case "r":
                    SoundInitializer.CRASH?.playSound()
                case "y":
                    SoundInitializer.RIDE?.playSound()
                default:
                    print("default")
                }

                return .handled
            })
            .onKeyPress(.space, phases: .down) { _ in
                print("Space key pressed!")
                drumState.isKickPressed.toggle()
                SoundInitializer.KICK?.playSound()
                return .handled
            }.onKeyPress(.space, phases: .up, action: { _ in
                drumState.isKickPressed.toggle()
                return .handled
            })
            .onAppear {
                isFocused = true
            }
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
