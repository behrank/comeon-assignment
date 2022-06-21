//
//  DetailView.swift
//  CasinoGames
//
//  Created by Behran Kankul on 17.06.2022.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var gameData: GameItem
    @Binding var gameIconUrl: URL
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                /// Background
                VStack {
                    AnimatedImageView(iconUrl: gameIconUrl)
                        .scaledToFill()
                        .colorMultiply(gameData.getThemeColor())
                        .frame(width: geo.size.width,
                               height: 220,
                               alignment: .center)
                    Spacer()
                }.clipped()
                
                /// Scrollable content
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: geo.size.width,
                                   height: .infinity,
                                   alignment: .center)
                            .foregroundColor(.white)
                            .padding(.top, 195)
                        
                        /// Content
                        LazyVStack {
                            ZStack {
                                VStack {
                                    Spacer()
                                    AnimatedImageView(iconUrl: gameIconUrl)
                                        .frame(width: 96,
                                               height: 96)
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(gameData.getThemeColor(), lineWidth: 4))
                                        .shadow(radius: 10)
                                    
                                }
                            }.frame(width: geo.size.width,
                                    height: 240)
                            
                            CustomText(fontSize: 11,
                                       fontType: .regular,
                                       text: gameData.generateTagsFromCategory().first?.name.uppercased() ?? "Lorem ipsum",
                                       color: .gray)
                                .padding(.top, 24)
                     
                            
                            CustomText(fontSize: 32,
                                       fontType: .bold, text: gameData.name ?? "Lorem ipsum")
                                .padding(.leading, 12)
                                .padding(.trailing, 12)
                                .multilineTextAlignment(.center)
                            
                            OnlinePlayerView(playerCount: gameData.playerCount)
                            
                            ContentHeaderTitleView(title: "DESCRIPTION")
                                .padding(.leading, 12).padding(.top, 18)
                            
                            CustomText(fontSize: Constants.contentFontSize,
                                       fontType: .regular,
                                       text: gameData.description ?? "")
                            .padding(EdgeInsets(top: 0,
                                                leading: 12,
                                                bottom: 0,
                                                trailing: 12))
                            .background(.white)
                            
                            ContentHeaderTitleView(title: "TAGS")
                                .padding(.leading, 12)
                                .padding(.top, 18)
                            
                            TagListView(gameData: gameData)
                                .padding(.leading, 12)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    ContentHeaderTitleView(title: "DEVELOPER")
                                    CustomText(fontSize: Constants.contentFontSize, fontType: .medium, text: "Behran Kankul")
                                }.padding(Constants.contentDefaultPadding)
                                
                                VStack(alignment: .leading) {
                                    ContentHeaderTitleView(title: "RATING")
                                    CustomText(fontSize: Constants.contentFontSize, fontType: .medium, text: "4.5")
                                }.padding(Constants.contentDefaultPadding)
                            }
                            
                            Spacer(minLength: 180)
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    PlayView().frame(width: geo.size.width, height: 96, alignment: .top)
                }
                
                Button(action: {
                   self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark.circle.fill").resizable()
                        .foregroundColor(.white)
                })
                .frame(width: 24, height: 24).position(x: 32, y: 32)
            }
        }.edgesIgnoringSafeArea(.all)
         .navigationBarBackButtonHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(gameData: Binding.constant(GameItem()),
                   gameIconUrl: Binding.constant(URL(string: "")!))
    }
}
