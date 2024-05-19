//
//  KeyboardManager.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 17/05/24.
//

import SwiftUI

extension CGKeyCode
{
    // Define whatever key codes you want to detect here
    static let kVK_Space: CGKeyCode = 0x31
    static let kVK_B: CGKeyCode = 0x0B  // Add this line for the "B" key

 
    var isPressed: Bool {
        CGEventSource.keyState(.combinedSessionState, key: self)
    }
}
 
class SpaceDetector: ObservableObject {
    @Published var isPressed: Bool = false
}

class BDetector: ObservableObject {
    @Published var isPressed: Bool = false
}
 
class KeyboardManager {
    static let spaceDetector = SpaceDetector()
    static let bDetector = BDetector()
    
    private static let pollingInterval: DispatchTimeInterval = .milliseconds(50)
    private static let pollingQueue = DispatchQueue.main
    
    static func start() {
        scheduleNextPoll(on: pollingQueue)
    }
    
    static var keyStates: [CGKeyCode: Bool] = [
//            .kVK_Space: false,
            .kVK_B: false  // Add this line for the "B" key
        ]

        static func dispatchKeyDown(_ key: CGKeyCode) {
            if key == .kVK_Space {
                spaceDetector.isPressed = true
            }
            
            if key == .kVK_B {
                bDetector.isPressed = true  // Add this line for the "B" key
            }
        }

        static func dispatchKeyUp(_ key: CGKeyCode) {
            if key == .kVK_Space {
                spaceDetector.isPressed = false
            }
            
            if key == .kVK_B {
                bDetector.isPressed = false  // Add this line for the "B" key
            }
        }
    private static func scheduleNextPoll(on queue: DispatchQueue) {
        queue.asyncAfter(deadline: .now() + pollingInterval) {
            pollKeyStates()
        }
    }
    
    static func pollKeyStates() {
        for (code, wasPressed) in keyStates {
            if code.isPressed {
                if !wasPressed {
                    dispatchKeyDown(code)
                    keyStates[code] = true
                }
            } else if wasPressed {
                dispatchKeyUp(code)
                keyStates[code] = false
            }
        }
        
        scheduleNextPoll(on: pollingQueue)
    }
}
