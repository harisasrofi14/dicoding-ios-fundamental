//
//  CardGame.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import SwiftUI

struct CardGame: View {
    var data : Game
    
    var body: some View {
        HStack{
            AsyncImage(
                url: URL(string: data.backgroundImage),
                content: { image in
                    image.resizable()
                        .frame(width: 100, height: 80)
                        .scaledToFill()
                },
                placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 80)
                }
                
            )
            .cornerRadius(10)
            
            VStack(alignment: .leading,spacing: 8){
                
                Text(data.name).font(.headline)
                    .lineLimit(2)
                
                HStack{
                    Image(systemName: "star")
                    Text(data.rating.formatted()).font(.subheadline)
                }
                
                HStack{
                    Image(systemName: "calendar")
                    Text(data.released).font(.subheadline)
                }
            }
        }
    }
}

struct CardGame_Previews: PreviewProvider {
    
    static var previews: some View {
        CardGame(data: Game(id: 3498, name: "Grand Theft Auto V", released: "2013-09-17", backgroundImage: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg", rating: 4.47, playtime: 72, metacritic: 91))
    }
}
