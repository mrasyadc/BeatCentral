//
//  KeyMapView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 20/05/24.
//

import SwiftUI

struct KeyMapView: View {
    @FocusState var isFocused: Bool
    @Binding var drumState: Drum

    var body: some View {
        Text("").focusable()
            .focused($isFocused)
            .onAppear {
                isFocused = true
            }
            .onKeyPress(phases: .down, action: { keyPress in
                switch keyPress.characters {
                case "c":
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
                case "f":
                    SoundInitializer.TOMHIGH?.playSound()
                    drumState.isTomHighPressed.toggle()
                case "g":
                    SoundInitializer.TOMLOW?.playSound()
                    drumState.isTomLowPressed.toggle()
                case "h":
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
    }
}
