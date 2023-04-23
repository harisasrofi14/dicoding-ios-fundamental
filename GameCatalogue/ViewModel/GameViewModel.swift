//
//  GameViewModel.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import Combine

@MainActor class GameViewModel: ObservableObject {
    @Published var games = GameList(count: 0, next: "", results: [])
    @Published var loading = false
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadData() {
        self.loading = true
        service.fetchGame { result in
            guard let games = result else {
                return
            }
            self.games.results = games
            self.loading = false
        }
    }
    
}
