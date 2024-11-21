//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import SwiftUI

struct FeaturedItemView: View {
    
    let player: PlayerModel
    
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
            .padding(.horizontal, 15)
    }
}

#Preview {
    FeaturedItemView(player: players[0])
}
