//
//  CartHelper.swift
//  Touchdown
//
//  Created by Adwait Barkale on 14/11/24.
//

import Foundation


class CartHelper {
    
    class func isCartEmpty() -> Bool {
        if cart.arrOfProductsInCart.count > 0 {
            return false
        }
        return true
    }
    
    class func isProductPresentInCart(productID: Int) -> (Bool, ProductModel?) {
        var isProductPresent = false
        var fetchedProduct: ProductModel?
        if cart.arrOfProductsInCart.count > 0 {
            let productInCart = cart.arrOfProductsInCart
            productInCart.forEach { product in
                if product.id == productID {
                    isProductPresent = true
                    fetchedProduct = product
                }
            }
        }
        if isProductPresent {
            return (isProductPresent, fetchedProduct)
        }
        return (isProductPresent, nil)
    }
    
    class func addProductToCart(product: ProductModel) {
        cart.arrOfProductsInCart.append(product)
    }
    
    class func removeProductFromCart(productID: Int) {
        if cart.arrOfProductsInCart.count > 0 {
            cart.arrOfProductsInCart.removeAll { product in
                product.id == productID
            }
        }
    }
    
    class func getTotalBillAmount() -> Double {
        var totalAmount: Double = 0
        if cart.arrOfProductsInCart.count > 0 {
            let productInCart = cart.arrOfProductsInCart
            productInCart.forEach { product in
                totalAmount += Double(product.price * (product.numberOfItem ?? 0))
            }
        }
        return totalAmount
    }
    
    class func updateProductQuantity(productID: Int, numberOfItems: Int) {
        if cart.arrOfProductsInCart.count > 0 {
            for i in 0..<cart.arrOfProductsInCart.count {
                if productID == cart.arrOfProductsInCart[i].id {
                    var product = cart.arrOfProductsInCart[i]
                    product.numberOfItem = numberOfItems
                    cart.arrOfProductsInCart[i] = product
                    break
                }
            }
        }
    }
    
    class func updateProductData(productID: Int, selectedProduct: ProductModel) {
        if cart.arrOfProductsInCart.count > 0 {
            let productInCart = cart.arrOfProductsInCart
            // Remove Element
            cart.arrOfProductsInCart.removeAll { product in
                product.id == productID
            }
            // Add New Element
            addProductToCart(product: selectedProduct)
        }
    }
    
}
