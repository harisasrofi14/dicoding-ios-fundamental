//
//  ProfileSheetView.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 17/04/23.
//

import SwiftUI

class GameSettings: ObservableObject {
    
    @Published var name  = UserDefaults.standard.string(forKey: "name")
    @Published var email = UserDefaults.standard.string(forKey: "email")

}

struct ProfileSheetView: View {
    
    @EnvironmentObject var settings: GameSettings
    @State var currentEmail = ""
    @State var currentName = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center) {
                Text("Edit Profile")
                    .font(.title3) .padding([.top, .bottom], 20)
                TextField("Enter your name...", text: $currentName )
                    .padding(.all)
                    .border(Color(UIColor.separator))
                    .padding(.leading)
                    .padding(.trailing)
                Spacer()
                TextField("Enter your email...", text: $currentEmail)
                    .padding(.all)
                    .border(Color(UIColor.separator))
                    .padding(.leading)
                    .padding(.trailing)
                Button {
                    self.settings.email = currentEmail
                    self.settings.name = currentName
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Submit").frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent)
                    .padding(.all)
                    .disabled(currentEmail.isEmpty || currentName.isEmpty)
            }.padding(10)
            .onAppear {
                currentEmail = settings.email ?? ""
                currentName = settings.name ?? ""
            }
        }
    }
}

struct ProfileSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSheetView()
    }
}
