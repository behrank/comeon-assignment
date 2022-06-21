//
//  AnimatedView.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import SwiftUI

struct AnimatedImageView: View {
    
    var iconUrl: URL
    
    var body: some View {
        Image("")
            .data(url: iconUrl)
            .resizable()
            .background(Color.viewBgColor)
    }
}

struct AnimatedView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedImageView(iconUrl: URL(string: "")!)
    }
}
