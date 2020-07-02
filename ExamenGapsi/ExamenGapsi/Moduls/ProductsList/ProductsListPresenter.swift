//
//  ProductsListPresenter.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class ProductsListPresenter  {
    
    // MARK: Properties
    weak var view: ProductsListViewProtocol?
    var interactor: ProductsListInteractorInputProtocol?
    var wireFrame: ProductsListWireFrameProtocol?
    
}

extension ProductsListPresenter: ProductsListPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.configTableView()
        self.view?.activityViewState(isVisible: false)
        self.interactor?.fetchProducts(product: "Chamarra", page: 1)
    }
    
    func fecthMoreData() {
        self.view?.activityViewState(isVisible: true)
        view?.updateFetchingState(state: true)
        self.interactor?.fetchMoreData()
    }
}

extension ProductsListPresenter: ProductsListInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func productsResponse(products: [ProductsModel]) {
        print("number of products: \(products.count)")
        self.view?.updateFetchingState(state: false)
        self.view?.activityViewState(isVisible: false)
        self.view?.updateContentTable(products: products)
    }
}
