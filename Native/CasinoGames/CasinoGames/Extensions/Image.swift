//
//  Image.swift
//  CasinoGames
//
//  Created by Behran Kankul on 21.06.2022.
//

import SwiftUI

extension Image {
    
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!).resizable()
        }
        
        return self.resizable()
    }
}
