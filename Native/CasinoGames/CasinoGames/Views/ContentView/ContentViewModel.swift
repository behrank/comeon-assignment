//
//  ContentViewModel.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import Foundation
import Combine
import WebKit

class ContentViewModel: NSObject, ObservableObject, WKScriptMessageHandler {

    @Published var gamesList            : [GameItem] = []
    @Published var gameCount            : Int = 0
    @Published var isLoading            : Bool = true
    @Published var isRequestFailed      : Bool = false
    @Published var errorMessage         : String = ""
    @Published var selectedGame         : GameItem = GameItem()
    @Published var selectedGameImgUrl   : URL = URL(string: "www.google.com")!
    @Published var detailRequired       : Bool = false

    var webView: WKWebView
    
    private var cancellable        : AnyCancellable?
    private var configuration      = WKWebViewConfiguration()
    private var userController     = WKUserContentController()
    private var navigationDelegate : WebViewNavigationDelegate
    private var ngrokUrl           : String = ""

    // MARK: - Actions
    var onCompletedLoadAction      : (()->Void)?

    override init() {
        
        configuration.websiteDataStore = .nonPersistent()
        configuration.userContentController = userController
        
        webView = WKWebView(frame: .zero,
                                 configuration: configuration)
        
        webView.isHidden = true
        
        navigationDelegate = WebViewNavigationDelegate()
        
        webView.navigationDelegate = navigationDelegate
        webView.contentMode = .scaleAspectFill
    }
    
    func loadUrl() {
        
        userController.add(self,
                           name: Constants.jsTriggerKeyword)
        
        navigationDelegate.onWebContentLoadedAction = webViewFinishedLoad
        
        guard let url = URL(string: ngrokUrl) else {
            return
        }

        webView.load(URLRequest(url: url))
    }
    
    func loginToNgRok() {
        
        if ngrokUrl.isEmpty == false {
            //No need to do this again.
            return
        }
        
        cancellable = APIService.login()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .failure(let error):
                    self.displayError(message: error.localizedDescription)
                    debugPrint(error)
                case .finished:
                    debugPrint("login finished")
                }

            }, receiveValue: { response in
                
                guard let url = response.tunnels?.first?.publicURL else {
                    self.displayError(message: Constants.webLoadFailMessage)
                    return
                }
                
                self.ngrokUrl = url
                self.loadUrl()
                self.fetchData()
            })
    }
    
    func fetchData() {
                
        cancellable = APIService.fetchGames()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.displayError(message: error.localizedDescription)

                    debugPrint(error)
                case .finished:
                    debugPrint("Game list fetch finished")
                }

            }, receiveValue: { response in
                self.gamesList.append(contentsOf: response)
                self.gameCount = self.gamesList.count
            })
    }
    
    func displayError(message: String) {
        Queue.main.executeAfter(delay: DelayTime.oneSecond) { [weak self] in
            self?.errorMessage = message
            self?.isRequestFailed = true
            self?.isLoading = false
        }
    }
    
    func webViewFinishedLoad() {
        Queue.main.executeAfter(delay: .twoSeconds) { [weak self] in
            self?.webView.isHidden = false
            self?.isLoading = false
        }
    }
    
    // MARK: - WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        debugPrint(message.body)
        
        guard let body = message.body as? [String: String],
              let gameCode = body["gameChosen"] else {
            
            displayError(message: Constants.gameNotFound)
            return
        }
        
        let tappedGame = gamesList.first { game in
            return game.code == gameCode
        }
        
        guard let tappedGame = tappedGame else {
            displayError(message: Constants.gameNotFound)
            return
        }
        
        selectedGame = tappedGame
        selectedGameImgUrl = URL(string: ngrokUrl.appending("/").appending(tappedGame.icon ?? ""))!
        detailRequired = true
    }
}
