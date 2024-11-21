//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
