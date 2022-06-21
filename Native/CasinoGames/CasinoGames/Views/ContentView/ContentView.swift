//
//  ContentView.swift
//  CasinoGames
//
//  Created by Behran Kankul on 16.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
        
    var body: some View {

        ZStack {
            WebView(webView: viewModel.webView)
                .sheet(isPresented: $viewModel.detailRequired) {
                    DetailView(gameData: $viewModel.selectedGame, gameIconUrl: $viewModel.selectedGameImgUrl)
                }
            
            //<- Loading ->
            if $viewModel.isLoading.wrappedValue {
                LoadingView()
            }
            
            //<- Error ->
            if $viewModel.isRequestFailed.wrappedValue {
                ErrorView(message: $viewModel.errorMessage).onAppear {
            
                    Queue.main.executeAfter(delay: DelayTime.twoSeconds) {
                        viewModel.errorMessage = ""
                        viewModel.isRequestFailed = false
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading: HStack {
                Image("user")
                CustomText(fontSize: 12, fontType: .semiBold, text: "Behran")
            },
            trailing:
                HStack {
                    NavigationLink {
                        ContentView()
                    } label: {
                        CustomText(fontSize: 13,
                                   fontType: .bold,
                                   text: "Total Games: \($viewModel.gameCount.wrappedValue)",
                                   color: .navbarTextColor)
                    }
                }
        ).background(Color.viewBgColor)
            .onAppear{
                viewModel.detailRequired = false
                viewModel.loginToNgRok()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
