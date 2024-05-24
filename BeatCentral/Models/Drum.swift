//
//  Drum.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 24/05/24.
//

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
