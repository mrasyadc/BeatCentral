//
//  DrumSetView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 24/05/24.
//

import SwiftUI

struct DrumSetView: View {
    @FocusState var isFocused: Bool
    @State private var drumState = Drum()

    private let sizeModifier = 1.1

    var body: some View {
        KeyMapView(isFocused: $isFocused, drumState: $drumState)

        Image("OpenHiHat")
            .resizable()
            .frame(
                width: drumState.isHihatOpenPressed ? 233 * sizeModifier : 233,
                height: drumState.isHihatOpenPressed ? 254.575 * sizeModifier : 254.575
            )
            .position(x: 197.5, y: 545.2875)
        Image("HiTom")
            .resizable()
            .frame(
                width: drumState.isTomHighPressed ? 179.75664 * sizeModifier : 179.75664,
                height: drumState.isTomHighPressed ? 177.91609 * sizeModifier : 177.91609
            )
            .position(x: 412.87832, y: 335.95805)
            .onTapGesture {
                drumState.isTomHighPressed.toggle()
            }

        Image("LoTom")
            .resizable()
            .frame(
                width: drumState.isTomLowPressed ? 190.9552 * sizeModifier : 190.9552,
                height: drumState.isTomLowPressed ? 189 * sizeModifier : 189
            )
            .position(x: 584.4776, y: 296.5)
            .onTapGesture {
                drumState.isTomLowPressed.toggle()
            }

        Image("FloorTom")
            .resizable()
            .frame(
                width: drumState.isFloorTomPressed ? 248.38773 * sizeModifier : 248.38773,
                height: drumState.isFloorTomPressed ? 245.84483 * sizeModifier : 245.84483
            )
            .position(x: 826.19386, y: 524.92242)
            .onTapGesture {
                drumState.isFloorTomPressed.toggle()
            }

        Image("Kick")
            .resizable()
            .frame(
                width: drumState.isKickPressed ? 285.99988 * sizeModifier : 285.99988,
                height: drumState.isKickPressed ? 284.91522 * sizeModifier : 284.91522
            )
            .position(x: 408.99994, y: 541.45761)
            .onTapGesture {
                drumState.isKickPressed.toggle()
            }

        Image("Snare")
            .resizable()
            .frame(
                width: drumState.isSnarePressed ? 286.38724 * sizeModifier : 286.38724,
                height: drumState.isSnarePressed ? 283.45581 * sizeModifier : 283.45581
            )
            .position(x: 562.19362, y: 466.72791)
            .onTapGesture {
                drumState.isSnarePressed.toggle()
            }

        Image("HiHat")
            .resizable()
            .frame(
                width: drumState.isHihatPressed ? 191 * sizeModifier : 191,
                height: drumState.isHihatPressed ? 208.68596 * sizeModifier : 208.68596
            )
            .position(x: 213.5, y: 394.34298)
            .onTapGesture {
                drumState.isHihatPressed.toggle()
            }

        Image("Crash")
            .resizable()
            .frame(
                width: drumState.isCrashPressed ? 277 * sizeModifier : 277,
                height: drumState.isCrashPressed ? 302.64926 * sizeModifier : 302.64926
            )
            .position(x: 284.5, y: 214.32463)
            .onTapGesture {
                drumState.isCrashPressed.toggle()
            }

        Image("Ride")
            .resizable()
            .frame(
                width: drumState.isRidePressed ? 277 * sizeModifier : 277,
                height: drumState.isRidePressed ? 302.64926 * sizeModifier : 302.64926
            )
            .position(x: 782.5, y: 222.32463)
            .onTapGesture {
                drumState.isRidePressed.toggle()
            }
    }
}

#Preview {
    DrumSetView()
}
