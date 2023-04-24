//
//  AboutView.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import SwiftUI

struct AboutView: View {
    @State private var showEditDialog: Bool = false
    @StateObject var settings = GameSettings()

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://ui-avatars.com/api/?name=\(settings.name?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "Haris")/&background=random&rounded=true&size=128")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            Button {
                showEditDialog = true
            }label: {
                Text("Edit")
            }.cornerRadius(100).sheet(isPresented: $showEditDialog) {
                ProfileSheetView().presentationDetents([.fraction(0.50), .fraction(0.60)])
                    .presentationDragIndicator(.visible)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .foregroundColor(.orange)
                      
                        .frame(width: 25.0, height: 25.0)
                    Text(settings.name ?? "Haris Asrofi").font(.subheadline)
                  
                }
                
                HStack {
                    Image(systemName: "mail")
                        .resizable()
                        .foregroundColor(.orange)
                      
                        .frame(width: 25.0, height: 20.0)
                    Text(settings.email ?? "harisasrofi14@gmail.com").font(.subheadline)
                  
                }
            }
            
        }.navigationTitle(Text("About"))
        .environmentObject(settings)
    }
        
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
