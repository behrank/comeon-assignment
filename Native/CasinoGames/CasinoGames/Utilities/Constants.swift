//
//  Constants.swift
//  CasinoGames
//
//  Created by Behran Kankul on 17.06.2022.
//

import Foundation
import UIKit
import SwiftUI

struct Constants {
    static var contentFontSize      : CGFloat = 14
    static var contentDefaultPadding: EdgeInsets = EdgeInsets(top: 8, leading: 12, bottom: 2, trailing: 12)
    
    // MARK: - Web
    static var jsTriggerKeyword     : String = "toggleMessageHandler"
    
    // MARK: - Error Messaeges
    static var webLoadFailMessage   : String = "Unable display web site. Please try again."
    static var gameNotFound         : String = "Game not found"
}
