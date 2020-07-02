//
//  ProductsListRemoteDataManager.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import Combine

class ProductsListRemoteDataManager:ProductsListRemoteDataManagerInputProtocol {

    private let webService = WebService()
    private var cancellable: AnyCancellable?
    
    var remoteRequestHandler: ProductsListRemoteDataManagerOutputProtocol?
    
    func fetchProducts(product: String, page: Int) {
        self.cancellable = webService.fectProducts(product: product, page: page).sink(receiveCompletion: { _ in }, receiveValue: { products in
            //print(products.last?.productDisplayName ?? "")
            self.remoteRequestHandler?.productsResponse(products: products)
        })
    }
    
}
