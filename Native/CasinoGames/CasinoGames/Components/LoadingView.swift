//
//  LoadingView.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
        }.padding(12)
        .background(Color.black)
        .cornerRadius(12)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
