//
//  ContentHeaderTitleView.swift
//  CasinoGames
//
//  Created by Behran Kankul on 17.06.2022.
//

import SwiftUI

struct ContentHeaderTitleView: View {
    
    var title: String
    
    var body: some View {
        HStack {
            CustomText(fontSize: 11,
                       fontType: .regular,
                       text: title,
                       color: .gray)
            Spacer()
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderTitleView(title: "Description")
    }
}
