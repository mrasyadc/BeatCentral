//
//  MenuView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 24/05/24.
//

import SwiftUI

struct MenuView: View {
    @State private var isNext = false
    var body: some View {
        if !isNext {
            ZStack {
                BackgroundView()

                VStack {
                    Text("Welcome to Drum Kit")
                        .font(.largeTitle)
                        .padding()

                    Text("Play")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
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
