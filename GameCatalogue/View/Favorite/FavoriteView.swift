//
//  FavoriteView.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 29/03/23.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var viewModel = FavoriteViewModel()
    
    var body: some View {
        VStack {
            if viewModel.loading {
               LoadingIndicator()
            } else if viewModel.empty {
                Text("Empty")
            } else {
                List {
                    ForEach(viewModel.games) { game in ZStack(alignment: .leading) { NavigationLink(destination: GameDetailView(gameId: "\(game.id)")) {
                                EmptyView()
                            }.opacity(0)
                            CardGame(data: game)
                        }
                        
                    }
                }
            }
        }.onAppear(
            perform: self.viewModel.fetchGameData
        )
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
