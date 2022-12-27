//
//  ContentView.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import SwiftUI

struct ContentView: View {
  
    var body: some View {
        NavigationStack{
            TabView(){
                GameListView().listStyle(.plain)
                    .tabItem{
                        Image(systemName: "square.grid.2x2")
                        Text("Home")
                    }
                AboutView().tabItem{
                    Image(systemName: "person.fill")
                    Text("About")
                }
            }//: TABVIEW
            .navigationBarTitle(Text("Games Catalogue"),displayMode: .inline)
        } //: NAVIGATION
        .tint(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

