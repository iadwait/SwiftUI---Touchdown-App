//
//  Shop.swift
//  Touchdown
//
//  Created by Adwait Barkale on 13/11/24.
//

import Foundation

// ObservableObject allows instances of this class to be used inside views, so that when important changes happen the view will reload
// The @Published property wrapper tells SwiftUI that changes to property should trigger view reloads

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: ProductModel? = nil
}

class Cart: Identifiable {
    static let shared = Cart()
    var arrOfProductsInCart: [ProductModel] = []
}

// ProductModel - ViewModel - Cart

// ViewModel - Get only necessary params in Cart
