//
//  AboutView.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
            Image("profile")
                .resizable()
                .frame(width: 150.0, height: 150.0)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            Text("Haris Asrofi").font(.title)
            
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "mail")
                        .resizable()
                        .foregroundColor(.orange)
                      
                        .frame(width: 25.0, height: 20.0)
                    Text(verbatim:"harisasrofi14@gmail.com").font(.subheadline)
                }
            }
            
        }.navigationTitle(Text("About"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
