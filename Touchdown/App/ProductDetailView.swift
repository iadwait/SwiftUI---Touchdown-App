//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject var shop: Shop
    @State var counter: Int
    @State var isProductPresentInCart = false
    @State var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var alertNavigateBack = false
        
//    @State private var scaleUp: Bool = false
//    @State private var rotation: Int = 180
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // NAV BAR
            NavigationBarDetailView(btnBackTapped: { self.btnBackTapped() })
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            // HEADER
            HeaderDetailView()
                .padding(.horizontal, 15)
            // DETAIL TOP PART
            TopPartDetailView()
                .scaleEffect(1)
                //.scaleEffect(scaleUp ? 1 : 0)
                //.rotationEffect(.degrees(Double(rotation)))
                .padding(.horizontal)
                .zIndex(1)
            // DETAIL BOTTOM PART
            VStack(alignment: .center, spacing: 0, content: {
                // RATINGS + SIZES
                RatingsSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                    //.padding(.vertical)
                
                // DESCRIPTION
                ScrollView(.vertical, showsIndicators: false) {
                    Text("\(shop.selectedProduct?.description ?? sampleProduct.description)")
                        .font(.system(.body, design: .rounded))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                }
            })
            .padding(.horizontal)
            .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105)
                    .padding(.bottom, -15)
            )
            // QUANTITY + FAVOURITE
            QuantityFavouriteDetailView(counter: $counter)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(.white)
                .padding(.bottom, -15)
            
            // ADD TO CART
            AddToCartDetailView(btnAddRemoveProductTapped: { self.btnAddRemoveProductTapped() }, counterValue: counter)
                .padding(.vertical, 20)
                .padding(.horizontal)
                .background(.white)
        }
        .onAppear(perform: {
            if let id = shop.selectedProduct?.id {
                isProductPresentInCart = CartHelper.isProductPresentInCart(productID: id).0
            }
        })
        .overlay(content: {
            if showingAlert {
                AlertView1(title: alertTitle, message: alertMessage, isVisible: $showingAlert, btnOkTapped: {
                    if alertNavigateBack {
                        shop.selectedProduct = nil
                        shop.showingProduct = false
                    }
                })
            }
        })
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(red: shop.selectedProduct?.red ?? sampleProduct.red,
                  green: shop.selectedProduct?.green ?? sampleProduct.green,
                  blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
        ).ignoresSafeArea(.all, edges: .all)
    }
    
    private func showAlert(title: String, message: String, navigateBack: Bool = false) {
        alertTitle = title
        alertMessage = message
        showingAlert = true
        alertNavigateBack = navigateBack
    }
    
    private func btnAddRemoveProductTapped() {
        // Add Product to Cart
        guard counter != 0 else {
            showAlert(title: "Alert", message: "Please select Quantity", navigateBack: false)
            return
        }
        
        if var selectedProduct = shop.selectedProduct {
            if isProductPresentInCart {
                //Remove Product
                CartHelper.removeProductFromCart(productID: selectedProduct.id)
                showAlert(title: "REMOVED SUCCESS", message: "\(shop.selectedProduct?.name ?? "") has been removed from cart", navigateBack: true)
            } else {
                // Add Product
                selectedProduct.numberOfItem = counter
                CartHelper.addProductToCart(product: selectedProduct)
                showAlert(title: "ADDED SUCCESS", message: "\(shop.selectedProduct?.name ?? "") has been added to cart", navigateBack: true)
            }
        }
    }
    
    private func btnBackTapped() {
        // Update Product data incase product is already added in cart
        if isProductPresentInCart, var selectedProduct = shop.selectedProduct  {
            selectedProduct.numberOfItem = counter
            CartHelper.updateProductData(productID: selectedProduct.id, selectedProduct: selectedProduct)
        }
        shop.selectedProduct = nil
        shop.showingProduct = false
    }
}

#Preview {
    ProductDetailView(counter: 0)
        .environmentObject(Shop())
}

/*
 Notch Handling
 
 On 1st Element
 .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
 
 // On Parent Element
 .ignoresSafeArea(.all, edges: .all)
 */
