//
//  URL.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import Foundation

extension URL {
    mutating func withQuery(_ dic: [String: String]) {
        guard var urlComponents = URLComponents(string: absoluteString) else { return }
        
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        
        for x in dic.keys {
            let queryItem = URLQueryItem(name: x, value: dic[x])
            queryItems.append(queryItem)
        }
        
        urlComponents.queryItems = queryItems
        self = urlComponents.url!
    }
}
