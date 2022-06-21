//
//  ImageLoader.swift
//  CasinoGames
//
//  Created by Behran Kankul on 21.06.2022.
//

import UIKit
import Combine

class ImageLoaderService: ObservableObject {
    
    @Published var image = UIImage()

    convenience init(url: URL) {
        self.init()
        loadImage(for: url)
    }

    func loadImage(for url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else {
                return
            }
            
            Queue.main.execute {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}
