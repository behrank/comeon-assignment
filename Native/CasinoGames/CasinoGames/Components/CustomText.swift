//
//  CustomText.swift
//  CasinoGames
//
//  Created by Behran Kankul on 17.06.2022.
//

import SwiftUI

struct CustomText: View {
    
    var fontSize: CGFloat
    var fontType: FontType
    var text    : String
    var color   : Color = Color.init("defaultTextColor")
    
    var body: some View {
        Text(text)
            .font(Font.custom(fontType.fontName,
                              size: fontSize))
            .foregroundColor(color)
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText(fontSize: 14,
                   fontType: .regular,
                   text: "Test")
    }
}
