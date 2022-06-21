//
//  ErrorView.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import SwiftUI

struct ErrorView: View {
    
    @Binding var message: String
    
    var body: some View {
        withAnimation {
            VStack {
                HStack {
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(Color.white)
                    CustomText(fontSize: 11,
                                fontType: .semiBold,
                                text: message,
                                color: .white)
                    Spacer()
                }.padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                .background(Color.red)
                .cornerRadius(4)
                .padding()
                
                Spacer()
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: Binding<String>.constant("Error message"))
    }
}
