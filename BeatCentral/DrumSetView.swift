//
//  DrumSetView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 24/05/24.
//

import SwiftUI

struct DrumKitView: View {
    var width: Double
    var height: Double
    var text: String
    var xPosition: Double
    var yPosition: Double
    var state: Bool
    var isTutorialModeOn: Bool
    var image: String

    var sizeModifier = 0.95

    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(
                    width: state ? width * sizeModifier : width,
                    height: state ? height * sizeModifier : height
                )
            if isTutorialModeOn {
                Text(text).font(Font.custom("Caveat Brush", size: 96))
                    .foregroundColor(Color(red: 0.7, green: 0.11, blue: 0.11))
            }

        }.position(x: xPosition, y: yPosition)
    }
}

struct DrumKitData {
    var width: Double
    var height: Double
    var xPosition: Double
    var yPosition: Double
    var image: String
    var state: Bool
    var isTutorialModeOn: Bool
    var text: String
}

struct DrumSetView: View {
    @FocusState var isFocused: Bool
    @State var drumState = Drum()
    @Binding var isTutorialModeOn: Bool

    private let sizeModifier = 0.95

    var body: some View {
        // Define your data as an array of DrumKitData
        let drumKitDataArray: [DrumKitData] = [
            DrumKitData(width: 233, height: 254.575, xPosition: 259.5, yPosition: 559.2875, image: "OpenHiHat", state: drumState.isHihatOpenPressed, isTutorialModeOn: isTutorialModeOn, text: "C"),
            DrumKitData(
                width: 179.75664,
                height: 177.91609,
                xPosition: 412.87832,
                yPosition: 335.95805,
                image: "HiTom",
                state: drumState.isTomHighPressed,
                isTutorialModeOn: isTutorialModeOn,
                text: "F"
            ),
            DrumKitData(
                width: 190.9552,
                height: 189,
                xPosition: 584.4776,
                yPosition: 296.5,
                image: "LoTom",
                state: drumState.isTomLowPressed,
                isTutorialModeOn: isTutorialModeOn,
                text: "G"
            ),
            DrumKitData(
                width: 248.38773,
                height: 245.84483,
                xPosition: 815.19386,
                yPosition: 457.92242,
                image: "FloorTom",
                state: drumState.isFloorTomPressed,
                isTutorialModeOn: isTutorialModeOn,
                text: "H"
            ),
            DrumKitData(
                width: 285.99988,
                height: 284.91522,
                xPosition: 573.99994,
                yPosition: 578.45761,
                image: "Kick",
                state: drumState.isKickPressed,
                isTutorialModeOn: isTutorialModeOn,
                text: "B"
            ),
            DrumKitData(
                width: 286.38724,
                height: 283.45581,
                xPosition: 457.19362,
                yPosition: 477.72791,
                image: "Snare",
                state: drumState.isSnarePressed,
                isTutorialModeOn: isTutorialModeOn,
                text: "V"
            ),
            DrumKitData(
                width: 191,
                height: 208.68596,
                xPosition: 201.5,
                yPosition: 415.34298,
                image: "HiHat",
                state: drumState.isHihatPressed,
                isTutorialModeOn: isTutorialModeOn,
                text: "X"
            ),
            DrumKitData(
                width: 277,
                height: 302.64926,
                xPosition: 278.5,
                yPosition: 202.32463,
                image: "Crash",
                state: drumState.isCrashPressed,
                isTutorialModeOn: isTutorialModeOn,
                text: "R"
            ),
            DrumKitData(
                width: 277,
                height: 302.64926,
                xPosition: 782.5,
                yPosition: 222.32463,
                image: "Ride",
                state: drumState.isRidePressed,
                isTutorialModeOn: isTutorialModeOn,
                text: "Y"
            )
        ]

        KeyMapView(drumState: $drumState)

        ForEach(drumKitDataArray.indices, id: \.self) { index in
            let data = drumKitDataArray[index]
            DrumKitView(
                width: data.width,
                height: data.height,
                text: data.text,
                xPosition: data.xPosition,
                yPosition: data.yPosition,
                state: data.state,
                isTutorialModeOn: data.isTutorialModeOn,
                image: data.image
            )
        }
    }
}
