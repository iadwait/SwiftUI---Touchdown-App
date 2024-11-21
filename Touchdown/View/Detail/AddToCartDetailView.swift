//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 13/11/24.
//

import SwiftUI

struct AddToCartDetailView: View {
    
    @EnvironmentObject var shop: Shop
    @State var isProductPresentInCart = false
    var btnAddRemoveProductTapped: () -> Void

    let counterValue: Int
    
    var body: some View {
        Button(action: {
            self.btnAddRemoveProductTapped()
            addRemoveProduct()
            //showingAlert.toggle()
        }, label: {
            Spacer()
            Text(isProductPresentInCart ? "Remove from cart".uppercased() : "Add to Cart".uppercased())
                .font(.system(.title2))
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Spacer()
        })
        .padding(15)
        .background(
            getButtonColor()
            .clipShape(Capsule()
                       //   .stroke(lineWidth: 2)
                      )
        )
        .onAppear(perform: {
            if let id = shop.selectedProduct?.id {
                isProductPresentInCart = CartHelper.isProductPresentInCart(productID: id).0
            }
        })
//        .alert("Alert", isPresented: $showingAlert, actions: {
//            Button(action: {
//                self.function()
//            }, label: {
//                Text("Ok")
//            })
//        }, message: {
//            Text(isProductPresentInCart ? "Removed Successfully" : "Added Successfully")
//        })
    }
    
    private func addRemoveProduct() {
//        // Add Product to Cart
//        guard counterValue != 0 else {
//            print("Please select quantity")
//            return
//        }
//        
//        if var selectedProduct = shop.selectedProduct {
//            if isProductPresentInCart {
//                //Remove Product
//                CartHelper.removeProductFromCart(productID: selectedProduct.id)
//            } else {
//                // Add Product
//                selectedProduct.numberOfItem = counterValue
//                CartHelper.addProductToCart(product: selectedProduct)
//            }
//        }
    }
    
    func getButtonColor() -> Color {
        if isProductPresentInCart {
            return Color(.red).opacity(0.8)
        } else {
            return Color(red: shop.selectedProduct?.red ?? sampleProduct.red,
                         green: shop.selectedProduct?.green ?? sampleProduct.green,
                         blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
        }
    }
}

#Preview {
    AddToCartDetailView(btnAddRemoveProductTapped: { }, counterValue: 0)
        .environmentObject(Shop())
        .padding()
}
