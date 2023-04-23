//
//  LoadingIndicator.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import SwiftUI

struct LoadingIndicator: View {
    
    @State var isDotLoading = false
    
    var body: some View {
        HStack {
            ForEach(0...4, id: \.self) { item in Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.orange)
                    .scaleEffect(isDotLoading ? 0:1)
                    .animation(.linear(duration: 0.6).repeatForever().delay(0.3 * Double(item)), value: isDotLoading)
            }.onAppear {
                isDotLoading = true
            }
        }
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
