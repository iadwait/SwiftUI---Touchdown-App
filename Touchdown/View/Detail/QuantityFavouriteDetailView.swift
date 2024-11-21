//
//  QuantityFavouriteDetailView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 13/11/24.
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
    
    @EnvironmentObject var shop: Shop
    @Binding var counter: Int
    
    func storeProductCount() {
        //.selectedProduct?.numberOfItem = counter
        
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button(action: {
                if counter > 0 {
                    counter -= 1
                }
            }, label: {
                Image(systemName: "minus.circle")
            })
            
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)
                //.padding(.horizontal, 4)
            
            Button(action: {
                counter += 1
            }, label: {
                Image(systemName: "plus.circle")
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "heart.circle")
                    .foregroundStyle(.pink)
            })
            
        }//: HSTACK
        .font(.system(.title))
        .foregroundStyle(.black)
        .onDisappear(perform: {
            storeProductCount()
        })
    }
}

#Preview {
    QuantityFavouriteDetailView(counter: .constant(0))
        .environmentObject(Shop())
        .padding(.horizontal)
}
