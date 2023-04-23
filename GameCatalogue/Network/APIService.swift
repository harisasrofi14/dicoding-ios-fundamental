//
//  APIService.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import Foundation

private let baseURL = "https://api.rawg.io/api"

class APIService: ServiceProtocol {
    let apiKey = "2a740599936e4195b197606fbb77697e"
    let page = "1"
    let pageSize = "20"

    func fetchGameById(gameId: String, completion: @escaping (GameDetail?) -> Void) {
        let components = URLComponents(string: "https://api.rawg.io/api/games/\(gameId)?key=\(apiKey)")!
        
        let request = URLRequest(url: components.url!)
        URLSession.shared.dataTask(with: request) { (data, response, _) in
            guard let response = response as? HTTPURLResponse else {
                completion(nil)
                return
            }
            if let data = data {
                if response.statusCode == 200 {
                    guard let games =
                            try? JSONDecoder().decode(GameDetail.self, from: data)
                    else {
                        completion(nil)
                        return
                    }
                    DispatchQueue.main.async {
                        completion(games)
                    }
                    
                } else {
                    completion(nil)
                    return
                }
            }
        }.resume()
        
    }
    
    func fetchGame(completion: @escaping ([Game]?) -> Void) {
        var components = URLComponents(string: "\(baseURL)/games")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "page", value: page),
            URLQueryItem(name: "page_size", value: pageSize)
        ]
        
        let request = URLRequest(url: components.url!)
        URLSession.shared.dataTask(with: request) { (data, response, _) in
            guard let response = response as? HTTPURLResponse else {
                completion(nil)
                return
            }
            if let data = data {
                if response.statusCode == 200 {
                    guard let responseData =
                            try? JSONDecoder().decode(GameList.self, from: data)
                    else {
                        completion(nil)
                        return
                    }
                    DispatchQueue.main.async {
                        completion(responseData.results)
                    }
                    
                } else {
                    completion(nil)
                    return
                }
            }
        }.resume()
    }
}
