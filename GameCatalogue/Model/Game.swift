//
//  Game.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import Foundation

struct Game: Codable, Identifiable {
    var id: Int
    var name: String
    var released: String
    var backgroundImage: String
    var rating: Float
    var playtime: Int
    var metacritic: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case playtime
        case metacritic
    }

}
