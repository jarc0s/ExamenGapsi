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
    }
}

extension ProductsListPresenter: ProductsListInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
