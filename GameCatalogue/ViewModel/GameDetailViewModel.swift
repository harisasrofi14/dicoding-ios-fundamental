//
//  GameDetailViewModel.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import Combine

class GameDetailViewModel : ObservableObject{
    @Published var gameDetail = GameDetail(id: 0, name: "", released: "", backgroundImage: "", backgroundImageAdditional: "", rating: 0, playtime: 0, metacritic: 0, description: "")
    @Published var loading : Bool = false
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadgameDetailById(id: String){
        self.loading = true
        service.fetchGameById(gameId: id){ result in
            
            guard let gameDetail = result else{
                return
            }
            self.gameDetail = gameDetail
            self.loading = false
        }
    }
}
