//
//  KeyboardView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 17/05/24.
//

import SwiftUI

struct KeyboardView: View
{
    @StateObject var detector: SpaceDetector
    
    var body: some View
    {
        Text(
            detector.isPressed
                ? "Spacebar is pressed"
                : "Spacebar is not pressed"
        ).padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(detector: KeyboardManager.spaceDetector)
    }
}
