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
    
    var body: some View {
        VStack{
            if gameDetailViewModel.loading{
                LoadingIndicator()
            } else {
                ZStack(){
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
                    VStack(alignment: .leading){
                        
                        Text(gameDetailViewModel.gameDetail.name)  .font(.system(size: 26, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                        
                        Spacer()
                            .frame(maxHeight: 16)
                        
                        HStack(spacing: 25){
                            HStack{
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                Text(gameDetailViewModel.gameDetail.rating.formatted()).font(.system(size: 16, weight: .medium, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            
                            HStack{
                                Image(systemName: "calendar").foregroundColor(.white)
                                Text(gameDetailViewModel.gameDetail.released).font(.system(size: 16, weight: .medium, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            
                            HStack{
                                Image(systemName: "clock").foregroundColor(.white)
                                Text(minutesToHoursAndMinutes(gameDetailViewModel.gameDetail.playtime)).font(.system(size: 16, weight: .medium, design: .rounded))
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                            .frame(maxHeight: 16)
                        
                        Text(gameDetailViewModel.gameDetail.description).font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }.padding(8)
                }
            }
        }.onAppear{
            self.gameDetailViewModel.loadgameDetailById(id: self.gameId)
        }.navigationBarTitleDisplayMode(.inline) .tint(.white)
        
    }
}



struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameId: "3498")
    }
}
