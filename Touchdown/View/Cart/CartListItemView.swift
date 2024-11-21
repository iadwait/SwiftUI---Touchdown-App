//
//  CartListItemView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 14/11/24.
//

import SwiftUI

private enum UpdateQuantity {
    case increase
    case decrease
}

struct CartListItemView: View {
    
    var product: ProductModel
    var reloadCartView: () -> Void
    
    var body: some View {
        HStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 14) {
                Text(product.name)
                    .font(.title3)
                .fontWeight(.bold)
                
                Text("Quantity:")
                
                // TODO: - Add counter Logic
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "minus.circle")
                    })
                    .onTapGesture {
                        updateProductCount(type: .decrease)
                    }
                    
                    Text("\(product.numberOfItem ?? 0)")
                    
                    Button(action: {}, label: {
                        Image(systemName: "plus.circle")
                    })
                    .onTapGesture {
                        print("Plus Button Taped")
                        updateProductCount(type: .increase)
                    }
                }
                .foregroundStyle(.black)
                
                // TODO: - Add Remove Item Logic
                Button(action: {}, label: {
                    Text("Remove Item")
                        .foregroundStyle(.red)
                        .font(.system(size: 15))
                })
                .onTapGesture {
                    print("Remove Item from Cart")
                    CartHelper.removeProductFromCart(productID: product.id)
                    reloadCartView()
                }
            }
            
            Spacer()
            
            Text(totalProductAmount())
                .font(.title3)
                .fontWeight(.black)
        }
    }
    
    private func updateProductCount(type: UpdateQuantity) {
        if let existingNumberOfItems = product.numberOfItem {
            let updatedNumberOfItem = type == .increase ? (existingNumberOfItems + 1) : (existingNumberOfItems != 1 ? existingNumberOfItems - 1 : existingNumberOfItems)
            print("\(#function) ProductID \(product.id) existingNumberOfItem: \(existingNumberOfItems) updateNumberOfItem: \(updatedNumberOfItem)")
            CartHelper.updateProductQuantity(productID: product.id, numberOfItems: updatedNumberOfItem)
            reloadCartView()
        }
    }
    
    func totalProductAmount() -> String {
        return "$\(product.price * (product.numberOfItem ?? 0))"
    }
    
}

#Preview {
    List {
        CartListItemView(product: sampleProduct, reloadCartView: {})
    }
}
