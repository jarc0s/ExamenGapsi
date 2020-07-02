//
//  ProductsListInteractor.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class ProductsListInteractor: ProductsListInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ProductsListInteractorOutputProtocol?
    var localDatamanager: ProductsListLocalDataManagerInputProtocol?
    var remoteDatamanager: ProductsListRemoteDataManagerInputProtocol?

}

extension ProductsListInteractor: ProductsListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
