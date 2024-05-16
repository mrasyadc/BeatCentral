//
//  KeyboardObserver.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 17/05/24.
//

import GameController

class KeyboardObserver: ObservableObject {
    @Published var keyboard: GCKeyboard?
    
    var observer: Any? = nil
    
    init() {
        observer = NotificationCenter.default.addObserver(
            forName: .GCKeyboardDidConnect,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            self?.keyboard = notification.object as? GCKeyboard
        }
    }
}
