//
//  NetworkManager.swift
//  ItunseDisk
//
//  Created by Рахим Габибли on 08.07.2024.
//

import Foundation

struct AlbumName: Codable {
    let results: [Album]
}

struct Album: Codable {
    let artistName: String
    let collectionName: String
    let artworkUrl100: String
    let trackCount: Int
}

class NetworkManager {
    let urlString = "https://itunes.apple.com/search?term=Alex&media=music&entity=album"

    func getCharacter(completionHandler: @escaping ([Album]) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error:", error.localizedDescription)
                return
            }

            guard let data else {
                print("Not data")
                return
            }

            do {
                let album = try JSONDecoder().decode(AlbumName.self, from: data).results
                print("Good")
                completionHandler(album)
            } catch {
                print("Error: ", error.localizedDescription)
            }
        }.resume()
    }
}
