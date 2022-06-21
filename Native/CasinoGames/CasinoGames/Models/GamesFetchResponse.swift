//
//  GamesFetchResponse.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import Foundation
import SwiftUI

typealias GamesFetchResponse = [GameItem]

struct GameItem: Codable, Hashable {
    var id: String = UUID().uuidString
    var playerCount: Int = Int.getRandomNumber()
    
    var categoryIds: [Int]?
    var code, description, icon, name: String?
    var shortDesc, theme: String?

    enum CodingKeys: String, CodingKey {
        case categoryIds
        case code
        case description
        case icon, name
        case shortDesc = "short_desc"
        case theme
    }
    
    func generateTagsFromCategory() -> [Tag] {
        var tagList: [Tag]  = []
        
        guard let categoryIds = categoryIds else {
            return []
        }

        for catId in categoryIds {
            tagList.append(Tag(rawValue: catId) ?? .action)
        }
        
        return tagList
    }
    
    func getThemeColor() -> Color {
        
        guard let theme = theme else {
            return Color.purple
        }
        
        let cleanedHex = theme.replacingOccurrences(of: "RGB(", with: "").replacingOccurrences(of: ")", with: "")
        
        return Color(hex: cleanedHex)
    }
}

