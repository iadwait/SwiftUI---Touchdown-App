//
//  NavigationBarView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import SwiftUI

struct NavigationBarView: View {
    
    // MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    //@State private var isNavigating: Bool = false
    var btnCartTapped: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundStyle(.black)
            })
            
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated = true
                    }
                })
            
            Spacer()
            
            Button(action: {
                self.btnCartTapped()
//                if cart.arrOfProductsInCart.count == 0 {
//                    print("Total Items in Cart = \(cart.arrOfProductsInCart.count)")
//                } else {
//                    // Navigate to Cart View
                    // TODO: - isNavigating = true Move this back
//                }
            }, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundStyle(.black)
                    
                    // Circle to indicate user that something is there in the cart
                    if cart.arrOfProductsInCart.count > 0 {
                        Text("\(cart.arrOfProductsInCart.count)")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .frame(width: 15, height: 15, alignment: .center)
                            .padding(2)
                            .background(Color.red.cornerRadius(7))
                            .offset(x: 15, y: -10)
//                        Circle()
//                            .fill(.red)
//                            .frame(width: 14, height: 14, alignment: .center)
//                            .offset(x: 13, y: -10)
                    }
                }
            })
            
            // Conditional NavigationLink
//            NavigationLink(destination: CartView(), isActive: $isNavigating) {
//                EmptyView()
//            }
        }
        
    }
    
}

#Preview {
    NavigationBarView(btnCartTapped: {})
        .padding(.horizontal, 10)
}
