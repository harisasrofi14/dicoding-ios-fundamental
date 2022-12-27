//
//  GameList.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import Foundation

struct GameList: Codable{
    var count : Int
    var next : String
    var results: [Game]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case results
    }
}
