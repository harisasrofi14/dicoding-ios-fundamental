//
//  ServiceProtocol.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import Foundation


protocol ServiceProtocol {
    func fetchGame(completion : @escaping ([Game]?)-> Void)
    func fetchGameById(gameId : String,completion: @escaping (GameDetail?) -> Void)
}
