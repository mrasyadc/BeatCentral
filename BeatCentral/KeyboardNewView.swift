//
//  KeyboardNewView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 17/05/24.
//

import SwiftUI

struct KeyboardNewView: View {
    @EnvironmentObject var keyboardObserver: KeyboardObserver
        
        var body: some View {
            Button("Tap Me") {
                guard let keyboardInput = keyboardObserver
                    .keyboard?.keyboardInput
                else {
                    // default action, no keyboard found
                    print("no keyboard found")
                    return
                }
                
                let commandIsPressed = keyboardInput.button(
                    forKeyCode: .leftGUI
                )?.isPressed ?? false || keyboardInput.button(
                    forKeyCode: .rightGUI
                )?.isPressed ?? false
                        
                let shiftIsPressed = keyboardInput.button(
                    forKeyCode: .leftShift
                )?.isPressed ?? false || keyboardInput.button(
                    forKeyCode: .rightShift
                )?.isPressed ?? false
                
                if commandIsPressed {
                    // action with CMD pressed
                } else if shiftIsPressed {
                    print("shift pressed")
                    // action with SHIFT pressed
                } else {
                    // default action
                }
            }
        }
}

#Preview {
    KeyboardNewView()
}
