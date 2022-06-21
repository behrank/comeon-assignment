//
//  FontTypes.swift
//  CasinoGames
//
//  Created by Behran Kankul on 17.06.2022.
//

import Foundation

enum FontType {
    case black
    case extraBold
    case bold
    case semiBold
    case medium
    case regular
    case light
    case extraLight
    case thin
    
    var fontName: String {
        switch self {
        case .black:        return "Poppins-Black"
        case .extraBold:    return "Poppins-ExtraBold"
        case .bold:         return "Poppins-Bold"
        case .semiBold:     return "Poppins-SemiBold"
        case .medium:       return "Poppins-Medium"
        case .regular:      return "Poppins-Regular"
        case .light:        return "Poppins-Light"
        case .extraLight:   return "Poppins-ExtraLight"
        case .thin:         return "Poppins-Thin"
        }
    }
}
