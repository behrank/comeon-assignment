//
//  APIService.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    static private var baseUrl: String = "https://kismet-bd1ac.firebaseio.com/"
    static private var ngrokApiKey: String = "Bearer 2AsZdnWvnjb9Kibq3f4xaRzWtdG_47yBXMjMeMZvoDJGvqdJE"
    
    // MARK: - Games list
    static func fetchGames() -> AnyPublisher<GamesFetchResponse, Error> {
        let gamesPath = "assignment/games.json"
        
        let url = URL(string: baseUrl.appending(gamesPath))!

        var request = URLRequest(url: url)
        request.httpMethod = "get"
        
        return URLSession.shared.dataTaskPublisher(for: request)
               .map(\.data)
               .decode(type: GamesFetchResponse.self, decoder: JSONDecoder())
               .eraseToAnyPublisher()
    }
    
    static func login() -> AnyPublisher<LoginResponse, Error> {
        let loginUrl = "https://api.ngrok.com/tunnels"
        
        let url = URL(string: loginUrl)!
        
        var request = URLRequest(url: url)
        request.addValue(ngrokApiKey, forHTTPHeaderField: "authorization")
        request.addValue("2", forHTTPHeaderField: "Ngrok-Version")
        
        return URLSession.shared.dataTaskPublisher(for: request)
               .map(\.data)
               .decode(type: LoginResponse.self, decoder: JSONDecoder())
               .eraseToAnyPublisher()
        
    }
}
