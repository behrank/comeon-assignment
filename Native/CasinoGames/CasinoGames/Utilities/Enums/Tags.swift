//
//  Tags.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import Foundation
import SwiftUI

enum Tag:Int, Hashable {
    case action = 0
    case rpg = 1
    case fps = 2
    case online = 3
    case simulation = 4
    
    var name: String {
        switch self {
        case .action:
            return "action"
        case .rpg:
            return "rpg"
        case .fps:
            return "fps"
        case .online:
            return "online"
        case .simulation:
            return "simulation"
        }
    }
    
    var color: Color {
        switch self {
        case .action:
            return .tagBlueText
        case .rpg:
            return .tagPinkText
        case .fps:
            return .tagPurpleText
        case .online:
            return .tagDarkBlueText
        case .simulation:
            return .tagNavyBlueText
        }
    }
}
