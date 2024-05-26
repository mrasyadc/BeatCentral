//
//  MenuView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 24/05/24.
//

import SwiftUI

struct MenuView: View {
    @State private var isNext = false
    init() {
        SoundInitializer.OPENING?.playSound()
    }

    var body: some View {
        if !isNext {
            ZStack {
                BackgroundView()

                VStack {
                    Text("BEAT CENTRAL")
                        .font(.custom("Caveat Brush", size: 128))
                        .foregroundColor(.black)

                    VStack(alignment: .center, spacing: 0) {
                        Image(systemName: "play.fill").resizable().frame(width: 36, height: 36)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .frame(width: 73, height: 77, alignment: .center)
                    .background(Color(red: 0.7, green: 0.11, blue: 0.11))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .inset(by: -2)
                            .stroke(Color(red: 0.86, green: 0.31, blue: 0.31), lineWidth: 4)
                    )
                    .onTapGesture {
                        isNext = true
                    }
                }
            }
        } else {
            DrumView()
        }
    }
}

#Preview {
    MenuView()
}
