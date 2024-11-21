//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 13/11/24.
//

import SwiftUI

struct NavigationBarDetailView: View {
    
    @EnvironmentObject var shop: Shop
    var btnBackTapped: () -> Void
    @State private var navigateToCartView: Bool = false
    
    var body: some View {
        HStack {
            Button(action: {
                self.btnBackTapped()
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button(action: {
                    // Navigate to Cart
                    self.btnCartTapped()
                }, label: {
                    ZStack {
                        Image(systemName: "cart")
                            .font(.title)
                        .foregroundStyle(.white)
                        
                        if !CartHelper.isCartEmpty() {
                            Text("\(cart.arrOfProductsInCart.count)")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .frame(width: 15, height: 15, alignment: .center)
                                .padding(2)
                                .background(Color.red.cornerRadius(7))
                                .offset(x: 15, y: -10)
//                            Circle()
//                                .fill(.red)
//                                .frame(width: 15, height: 15, alignment: .trailing)
//                                .offset(x: 15, y: -10)
                        }
                        
                    }
                })
            })
            
            NavigationLink(
                destination: CartView(),
                isActive: $navigateToCartView
            ) {
                EmptyView()  // You don't need a visible link here, just a trigger
            }
        }
    }
    
    private func btnCartTapped() {
        print("Cart Tapped")
        navigateToCartView = true
    }
    
}

#Preview {
    NavigationBarDetailView(btnBackTapped: {})
        .environmentObject(Shop())
        .background(Color.gray)
        .padding()
}
