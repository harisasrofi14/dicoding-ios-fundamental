//
//  GameListView.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import SwiftUI

struct GameListView: View {
    
    @ObservedObject var gameViewModel = GameViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            if gameViewModel.loading {
                LoadingIndicator()
            } else {
                if !gameViewModel.games.results.isEmpty {
                    List {
                        ForEach(gameViewModel.games.results) { game in
                            ZStack(alignment: .leading) {
                                NavigationLink(destination: GameDetailView(gameId: "\(game.id)")) {
                                    EmptyView()
                                }.opacity(0)
                                CardGame(data: game)
                            }
                        }
                    }
                } else {
                    Text("Error")
                }
            }
        }.onAppear {
            self.gameViewModel.loadData()
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
