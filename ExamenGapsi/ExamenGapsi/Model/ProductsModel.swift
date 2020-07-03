//
//  ProductsModel.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

struct ProductsResponse: Decodable {
    let plpResults: ProductsResults
}

struct ProductsResults: Decodable {
    let records: [ProductsModel]
}

struct ProductsModel: Decodable {
    let productId: String
    let productDisplayName: String
    let listPrice: Double
    let promoPrice: Double
    let smImage: String
    
    func getPrice() -> Double {
        promoPrice == 0.0 ? listPrice : promoPrice
    }
}
