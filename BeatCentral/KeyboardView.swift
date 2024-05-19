//
//  KeyboardView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 17/05/24.
//

import SwiftUI

struct KeyboardView: View
{
    @StateObject var SpaceDetector: SpaceDetector
//    @StateObject var BDetector: BDetector
    var body: some View
    {
        Text(
            SpaceDetector.isPressed
                ? "Spacebar is pressed"
                : "Spacebar is not pressed"
        ).padding()
//        Text(
//            BDetector.isPressed
//                ? "B is pressed"
//                : "B is not pressed"
//        ).padding()
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(SpaceDetector: KeyboardManager.spaceDetector /*BDetector: KeyboardManager.bDetector)*/
    )}
}
