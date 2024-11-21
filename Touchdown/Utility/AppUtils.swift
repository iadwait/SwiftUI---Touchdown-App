//
//  AppUtils.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import Foundation

enum ModelType {
    case PlayerModel
    case CategoryModel
    case ProductModel
    case BrandModel
}

class AppUtils {
    
    static let shared = AppUtils()
    
    func getData(forModel: ModelType) -> Any {
        let parser = ParserHelper.shared
        switch forModel {
        case .PlayerModel:
            return parser.parseData(fileName: "player.json", parsingType: [PlayerModel].self) ?? [PlayerModel]()
        case .CategoryModel:
            return parser.parseData(fileName: "category.json", parsingType: [CategoryModel].self) ?? [CategoryModel]()
        case .ProductModel:
            return parser.parseData(fileName: "product.json", parsingType: [ProductModel].self) ?? [ProductModel]()
        case .BrandModel:
            return parser.parseData(fileName: "brand.json", parsingType: [BrandModel].self) ?? [BrandModel]()
        }
    }
    
}

class ParserHelper {
    
    static let shared = ParserHelper()
    
    func parseData<T: Codable>(fileName: String, parsingType: T.Type) -> T? {
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: "") else {
            print("Unable to find the file")
            return nil
        }
        do {
            let parsedObject = try JSONDecoder().decode(parsingType, from: Data(contentsOf: filePath))
            return parsedObject
        } catch let err {
            print("Failed to Parse Data (\(fileName)): \(err.localizedDescription)")
            return nil
        }
    }
    
}
