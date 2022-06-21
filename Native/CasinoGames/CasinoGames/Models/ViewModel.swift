//
//  ViewModel.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var isLoading        : Bool = true
    @Published var isRequestFailed  : Bool = false
    @Published var errorMessage     : String = ""
    internal var cancellable        : AnyCancellable?
}
