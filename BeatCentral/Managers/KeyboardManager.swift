//
//  KeyboardManager.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 17/05/24.
//

import SwiftUI
import GameController

extension CGKeyCode
{
    // Define whatever key codes you want to detect here
    static let kVK_Space: CGKeyCode = 0x31
 
    var isPressed: Bool {
        CGEventSource.keyState(.combinedSessionState, key: self)
    }
}
 
class SpaceDetector: ObservableObject {
    @Published var isPressed: Bool = false
}

class Bdetector {
    @Published var isPressed: Bool = false
}
 
class KeyboardManager {
    static let spaceDetector = SpaceDetector()
    static let bDetector = Bdetector()
    private static let pollingInterval: DispatchTimeInterval = .milliseconds(50)
    private static let pollingQueue = DispatchQueue.main
    
    static func start() {
        scheduleNextPoll(on: pollingQueue)
    }
    
    static var keyStates: [CGKeyCode: Bool] = [
        .kVK_Space: false,
        // populate with other key codes you're interested in
    ]
    
    static func dispatchKeyDown(_ key: CGKeyCode)
    {
        if key == .kVK_Space {
            spaceDetector.isPressed = true
        }
    }
 
    static func dispatchKeyUp(_ key: CGKeyCode) {
        if key == .kVK_Space {
            spaceDetector.isPressed = false
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
