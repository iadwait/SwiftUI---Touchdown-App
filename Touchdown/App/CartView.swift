//
//  CartView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 14/11/24.
//

import SwiftUI

struct CartView: View {
    
    @State private var reloadViewCount: Int = 0
    @EnvironmentObject var shop: Shop
    @State private var showingAlert = false
    
    var body: some View {
        if CartHelper.isCartEmpty() {
            VStack {
                Image("CartEmpty")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .center)
                
                
                Text("It looks like you haven't added anything to your cart yet. Explore our products!")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
            }
            .offset(y: -30)
        } else {
            VStack {
                Text("\(reloadViewCount)").hidden()
                VStack(alignment: .leading, spacing: 10) {
                    Text("Cart Details:")
                        .font(.system(size: 28, weight: .bold, design: .default))
                    Text("Total Number of Items: \(cart.arrOfProductsInCart.count)")
                        .font(.system(size: 20, weight: .regular, design: .default))
                    Text("Total Amount: ₹\(String(format: "%.2f", CartHelper.getTotalBillAmount()))")
                        .font(.system(size: 20, weight: .regular, design: .default))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    Color.gray.opacity(0.4)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                )
                .padding(.horizontal, 12)
                List {
                    let productInCart = cart.arrOfProductsInCart
                    ForEach(productInCart) { product in
                        CartListItemView(product: product, reloadCartView: {
                            reloadViewCount += 1
                            shop.selectedProduct = nil
                            shop.showingProduct = false
                        })
                    }
                    //CartListItemView(product: sampleProduct) // Testing
                }
                .listStyle(PlainListStyle())
                .background(.white)
                .navigationTitle("Cart")
                .navigationBarTitleDisplayMode(.inline)
                
                HStack {
                    Button(action: {
                        showingAlert = true
                    }, label: {
                        Text("Proceed to Buy \(cart.arrOfProductsInCart.count) Items")
                            .padding()
                    })
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .background(
                        Color.blue
                            .clipShape(Capsule())
                    )
                    .onTapGesture {
                        showingAlert = true
                    }
                }
                .padding()
            }
            .overlay(content: {
                if showingAlert {
                    AlertView1(title: "Alert", message: "This functionality is yet to be developed", isVisible: $showingAlert, btnOkTapped: {
                        showingAlert = false
                    })
                }
            })
        }
    }
    
    func reloadView() {
        reloadViewCount += 1
    }
    
}

#Preview {
    CartView()
}
