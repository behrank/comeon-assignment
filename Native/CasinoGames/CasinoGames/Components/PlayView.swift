//
//  PlayView.swift
//  CasinoGames
//
//  Created by Behran Kankul on 17.06.2022.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        ZStack {
            Color.init("playViewBackground")
            VStack {
                HStack {
                    CustomText(fontSize: 14,
                               fontType: .semiBold,
                               text: "Free to play",
                               color: Color.white)
                    Spacer()
                    Button {
                        debugPrint("Play button tapped")
                    } label: {
                        CustomText(fontSize: 16,
                                   fontType: .bold,
                                   text: "Play",
                                   color: Color.init("playViewBackground")).frame(width: 120, height: 40)
                    }.background(Color.white).cornerRadius(12)
                }.padding()
                Spacer()
            }
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
