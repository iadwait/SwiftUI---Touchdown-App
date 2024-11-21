//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import SwiftUI

struct FeaturedTabView: View {
    
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
            }
        }
        .padding(.top, 10)
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 260)
    }
}

#Preview {
    FeaturedTabView()
}
