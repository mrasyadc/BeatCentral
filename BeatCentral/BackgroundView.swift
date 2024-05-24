//
//  BackgroundView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 24/05/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("beatCentralBackground")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView()
}
