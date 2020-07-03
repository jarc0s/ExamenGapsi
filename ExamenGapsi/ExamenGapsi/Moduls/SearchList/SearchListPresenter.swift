//
//  SearchListPresenter.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class SearchListPresenter  {
    
    // MARK: Properties
    weak var view: SearchListViewProtocol?
    var interactor: SearchListInteractorInputProtocol?
    var wireFrame: SearchListWireFrameProtocol?
    var parentProtocol: SearchListToParentViewProtocol?
}

extension SearchListPresenter: SearchListPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.fetchProductNamesFromLocal()
    }
    
    func searchProducts(productName: String) {
        interactor?.storeProductNameOnLocal(productName: productName)
        parentProtocol?.performSearchForProduct(product: productName)
        self.view?.dismissView()
    }
    
    
}

extension SearchListPresenter: SearchListInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func currentParameters(parameters: [String]) {
        view?.updateContentTable(products: parameters)
    }
}
