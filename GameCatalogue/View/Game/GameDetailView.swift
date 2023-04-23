//
//  GameDetailView.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import SwiftUI

struct GameDetailView: View {
    var gameId: String
    @ObservedObject var gameDetailViewModel = GameDetailViewModel()
    @ObservedObject var viewModel = FavoriteViewModel()

    var body: some View {
        VStack {
            if gameDetailViewModel.loading {
                LoadingIndicator()
            } else {
                if !gameDetailViewModel.gameDetail.name.isEmpty {
                    ZStack {
                        Color.clear
                            .background(
                                AsyncImage(
                                    url: URL(string: gameDetailViewModel.gameDetail.backgroundImage),
                                    content: { image in
                                        image.resizable()
                                    },
                                    placeholder: {
                                        Color.black.opacity(0.6)
                                    }
                                )
                                .overlay {
                                    Color.black
                                        .opacity(0.6)
                                }
                                    .scaledToFill()
                                    .ignoresSafeArea()
                            )
                        VStack(alignment: .leading) {
                            Text(gameDetailViewModel.gameDetail.name)  .font(.system(size: 26, weight: .heavy, design: .rounded))
                                .foregroundColor(.white)
                            Spacer()
                                .frame(maxHeight: 16)
                            Button(action: {
                                viewModel.isExist ? viewModel.deleteGameById(gameDetailViewModel.gameDetail.id) : viewModel.addDataToCoreData(game: gameDetailViewModel.gameDetail)
                            }, label: {
                                HStack {
                                    Image(systemName: viewModel.isExist  ? "bookmark.fill" : "bookmark").foregroundColor(.yellow)
                                    Text(
                                        viewModel.isExist ? "Remove from watchlist" : "Add to watchlist")
                                    }
                                }
                            )
                            Spacer()
                                .frame(maxHeight: 16)
                            HStack(spacing: 25) {
                                HStack {
                                    Image(systemName: "star.fill").foregroundColor(.yellow)
                                    Text(gameDetailViewModel.gameDetail.rating.formatted()).font(.system(size: 16, weight: .medium, design: .rounded))
                                        .foregroundColor(.white)
                                }
                                HStack {
                                    Image(systemName: "calendar").foregroundColor(.white)
                                    Text(gameDetailViewModel.gameDetail.released).font(.system(size: 16, weight: .medium, design: .rounded))
                                        .foregroundColor(.white)
                                }
                                HStack {
                                    Image(systemName: "clock").foregroundColor(.white)
                                    Text(minutesToHoursAndMinutes(gameDetailViewModel.gameDetail.playtime))
                                        .font(.system(size: 16,
                                                      weight: .medium,
                                                      design: .rounded))
                                        .foregroundColor(.white)
                                }
                            }
                            Spacer()
                                .frame(maxHeight: 16)
                            Text(gameDetailViewModel.gameDetail.description).font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            Spacer()
                            
                        }.padding(10)
                        
                    }
                }
            }
        }.onAppear {
            self.gameDetailViewModel.loadgameDetailById(id: self.gameId)
            self.viewModel.getGameDataById(Int(self.gameId) ?? 0)
        }.navigationBarTitleDisplayMode(.inline) .tint(.white)
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameId: "3498")
    }
}
