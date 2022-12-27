//
//  GamaDetail.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import Foundation

struct GameDetail: Codable, Identifiable{
    var id : Int
    var name : String
    var released : String
    var backgroundImage : String
    var backgroundImageAdditional : String
    var rating : Float
    var playtime : Int
    var metacritic : Int
    var description : String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case rating
        case playtime
        case metacritic
        case description = "description_raw"
    }
}
