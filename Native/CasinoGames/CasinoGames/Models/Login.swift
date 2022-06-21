//
//  Login.swift
//  CasinoGames
//
//  Created by Behran Kankul on 21.06.2022.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    var tunnels: [Tunnel]?
    var uri: String?
    var nextPageURI: String?

    enum CodingKeys: String, CodingKey {
        case tunnels, uri
        case nextPageURI = "next_page_uri"
    }
}

// MARK: - Tunnel
struct Tunnel: Codable {
    var id: String?
    var publicURL: String?
    var startedAt: Date?
    var metadata, proto, region: String?
    var tunnelSession, endpoint: Endpoint?
    var forwardsTo: String?

    enum CodingKeys: String, CodingKey {
        case id
        case publicURL = "public_url"
        case startedAt
        case metadata, proto, region
        case tunnelSession
        case endpoint
        case forwardsTo
    }
}

// MARK: - Endpoint
struct Endpoint: Codable {
    var id: String?
    var uri: String?
}
