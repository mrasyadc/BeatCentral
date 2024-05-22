//
//  KeyMapView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 20/05/24.
//

import SwiftUI

struct KeyMapView: View {
    var isFocused: FocusState<Bool>.Binding
    @Binding var drumState: Drum

    var body: some View {
        Text("").focusable()
            .focused(isFocused)
            .onKeyPress(phases: .down, action: { keyPress in
//                print("""
//                    New key event:
//                    Key: \(keyPress.characters)
//                    Modifiers: \(keyPress.modifiers)
//                    Phase: \(keyPress.phase)
//                    Debug description: \(keyPress.debugDescription)
//                """)
                switch keyPress.characters {
                case "z":
                    SoundInitializer.HIHATOPEN?.playSound()
                    drumState.isHihatOpenPressed.toggle()
                case "x":
                    SoundInitializer.HIHAT?.playSound()
                    drumState.isHihatPressed.toggle()
                case "v":
                    SoundInitializer.SNARE?.playSound()
                    drumState.isSnarePressed.toggle()
                case "b":
                    SoundInitializer.KICK?.playSound()
                    drumState.isKickPressed.toggle()
                case "g":
                    SoundInitializer.TOMHIGH?.playSound()
                    drumState.isTomHighPressed.toggle()
                case "h":
                    SoundInitializer.TOMLOW?.playSound()
                    drumState.isTomLowPressed.toggle()
                case "j":
                    SoundInitializer.FLOORTOM?.playSound()
                    drumState.isFloorTomPressed.toggle()
                case "r":
                    SoundInitializer.CRASH?.playSound()
                    drumState.isCrashPressed.toggle()
                case "y":
                    SoundInitializer.RIDE?.playSound()
                    drumState.isRidePressed.toggle()
                default:
                    print("default")
                }

                return .handled
            })
            .onKeyPress(phases: .up, action: { _ in
                drumState.setAllFalse()
                return .handled
            })
//            .onAppear {
//                isFocused = true
//            }
    }
}
