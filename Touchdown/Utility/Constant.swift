//
//  Constant.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import SwiftUI


// DATA
let players: [PlayerModel] = AppUtils.shared.getData(forModel: .PlayerModel) as! [PlayerModel]
let categories: [CategoryModel] = AppUtils.shared.getData(forModel: .CategoryModel) as! [CategoryModel]
let products: [ProductModel] = AppUtils.shared.getData(forModel: .ProductModel) as! [ProductModel]
let sampleProduct = products[0]
let brands: [BrandModel] = AppUtils.shared.getData(forModel: .BrandModel) as! [BrandModel]
let cart: Cart = Cart.shared

// COLOR
let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
