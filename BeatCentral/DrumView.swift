//
//  DrumView.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 24/05/24.
//

import SwiftUI

struct DrumView: View {
    @State var isTutorialModeOn = false
    var body: some View {
        ZStack {
            BackgroundView()
            DrumSetView(isTutorialModeOn: $isTutorialModeOn)
            VStack {
                HStack {
                    Spacer()
                    VStack(alignment: .center, spacing: 0) {
                        Image(systemName: isTutorialModeOn ? "xmark" : "questionmark")
                            .resizable()
                            .frame(width: 48)
                            .font(.system(size: 48, weight: .bold))
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
                        isTutorialModeOn.toggle()
                    }.padding().padding()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    DrumView()
}
