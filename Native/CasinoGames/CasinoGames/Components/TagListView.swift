//
//  TagListView.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import SwiftUI

struct TagListView: View {
    var gameData: GameItem
    
    var body: some View {
        ScrollView(.horizontal,
                   showsIndicators: false) {
            HStack {
                ForEach(gameData.generateTagsFromCategory(), id: \.self) { tag in
                    TagView(text: tag.name,
                            textColor: tag.color)
                }
            }
        }
    }
}

struct TagListView_Previews: PreviewProvider {
    static var previews: some View {
        TagListView(gameData: GameItem())
    }
}
