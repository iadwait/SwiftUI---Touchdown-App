//
//  ProductModel.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import Foundation

struct ProductModel: Codable, Identifiable {
    
    let id: Int
    let name: String
    let image: String
    let price: Int
    let description: String
    let color: [Double]
    
    var red: Double { return color[0] }
    var green: Double { return color[1] }
    var blue: Double { return color[2] }
    
    var formattedPrice: String { return "$\(price)" }
    
    var numberOfItem: Int? = nil
    var addedToCart: Bool? = nil
}
