//
//  TagView.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import SwiftUI

struct TagView: View {
    var text: String
    var textColor: Color
    
    var body: some View {
        CustomText(fontSize: 10,
                   fontType: .semiBold,
                   text: text.uppercased(),
                   color: textColor)
        .padding(6)
        .background(textColor.opacity(0.2))
        .cornerRadius(12)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(text: "Action",
                textColor: Color.tagPurpleText)
    }
}
