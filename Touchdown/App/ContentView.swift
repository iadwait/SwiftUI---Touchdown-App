//
//  ContentView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var shop: Shop
    @State private var navigateToCartView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if shop.showingProduct == false && shop.selectedProduct == nil {
                    VStack {
                        NavigationBarView(btnCartTapped: { self.btnCartTapped() })
                            .padding(.horizontal, 15)
                            .padding(.bottom)
                            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                            .background(.white)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                FeaturedTabView()
                                //Spacer() // Spacer does not work to occupy content in scrollview due to dynamic height
                                
                                CategoryGridView()
                                
                                TitleView(title: "Helmets")
                                
                                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                                    ForEach(products) { product in
                                        ProductItemView(product: product)
                                            .onTapGesture {
                                                withAnimation(.easeOut) {
                                                    shop.selectedProduct = product
                                                    shop.showingProduct = true
                                                }
                                            }
                                    }
                                })
                                
                                TitleView(title: "Brands")
                                
                                BrandGridView()
                                
                                FooterView()
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .background(colorBackground.ignoresSafeArea(.all, edges: .all))
                } else {
                    if let selectedProduct = shop.selectedProduct {
                        let response = CartHelper.isProductPresentInCart(productID: selectedProduct.id)
                        let numberOfItem = response.0 ? response.1?.numberOfItem : 0
                        ProductDetailView(counter: numberOfItem ?? 0)
                    } else {
                        ProductDetailView(counter: 0)
                    }
                }
                
                NavigationLink(
                    destination: CartView(),
                    isActive: $navigateToCartView
                ) {
                    EmptyView()  // You don't need a visible link here, just a trigger
                }
                
            }
            .ignoresSafeArea(.all, edges: .top)
            .navigationBarHidden(true)
        }
    }
    
    private func btnCartTapped() {
        print("Cart Tapped")
        navigateToCartView = true
    }
}

#Preview {
    ContentView()
        .environmentObject(Shop())
}


//VStack {
//    NavigationBarView()
//    ScrollView(.vertical, showsIndicators: false) {
//        VStack {
//            FeaturedTabView()
//            //Spacer() // Spacer does not work to occupy content in scrollview due to dynamic height
//            
//            CategoryGridView()
//            
//            FooterView()
//                .padding(.horizontal)
//        }
//    }
//    .background(colorBackground)
//}
