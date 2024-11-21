//
//  ProductItemView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import SwiftUI

struct ProductItemView: View {
    
    let product: ProductModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                //.frame(width: 180, height: 180, alignment: .center)
                .background(Color(red: product.red, green: product.green, blue: product.blue))
                .cornerRadius(10)
            
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            
            Text(product.formattedPrice)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    ProductItemView(product: products[0])
        .padding()
        .background(colorBackground)
}
