//
//  OnlinePlayerView.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import SwiftUI

struct OnlinePlayerView: View {
    var isSimpleViewRequired: Bool = false
    var playerCount: Int
    
    var body: some View {
        HStack(spacing: 2) {
            if !isSimpleViewRequired {
                Image(systemName: "person.circle").frame(width: 24, height: 24)
            }
            
            CustomText(fontSize: isSimpleViewRequired ? 9 : 11,
                       fontType: isSimpleViewRequired ? .light : .bold,
                       text: playerCount.description.appending(" players online"),
                       color: isSimpleViewRequired ? .gray : .green)
        }.foregroundColor(.green)
    }
}

struct OnlinePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        OnlinePlayerView(playerCount: Int.getRandomNumber())
    }
}
