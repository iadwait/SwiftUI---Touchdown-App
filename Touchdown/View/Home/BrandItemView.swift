//
//  BrandItemView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import SwiftUI

struct BrandItemView: View {
    
    let brand: BrandModel
    
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit() // By not applying frame whatever height you will give to parent component it will scale accordingly
            .padding()
            .background(Color.white.cornerRadius(10))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

#Preview {
    BrandItemView(brand: brands[0])
}
