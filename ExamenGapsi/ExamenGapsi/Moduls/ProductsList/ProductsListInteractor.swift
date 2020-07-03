//
//  ProductsListInteractor.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class ProductsListInteractor: ProductsListInteractorInputProtocol {

    var productName: String = ""
    var currentPage: Int = 0
    var productsStock: [ProductsModel] = []
    
    // MARK: Properties
    weak var presenter: ProductsListInteractorOutputProtocol?
    var localDatamanager: ProductsListLocalDataManagerInputProtocol?
    var remoteDatamanager: ProductsListRemoteDataManagerInputProtocol?
    
    func fetchProducts(product: String, page: Int) {
        self.productName = product
        self.currentPage = page
        self.productsStock = []
        self.remoteDatamanager?.fetchProducts(product: product, page: page)
    }
    
    func fetchMoreData(){
        if !productName.isEmpty {
            currentPage+=1
            self.remoteDatamanager?.fetchProducts(product: productName, page: (currentPage))
        }else {
            presenter?.productsResponse(products: [ProductsModel]())
        }
    }

}

extension ProductsListInteractor: ProductsListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func productsResponse(products: [ProductsModel]) {
        self.productsStock.append(contentsOf: products)
        presenter?.productsResponse(products: self.productsStock)
    }
}
