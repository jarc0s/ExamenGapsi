//
//  ProductsListProtocols.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

protocol ProductsListViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ProductsListPresenterProtocol? { get set }
    func configTableView()
    func updateContentTable(products: [ProductsModel])
    func updateFetchingState(state: Bool)
    func activityViewState(isVisible: Bool)
}

protocol ProductsListWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createProductsListModule() -> UIViewController
}

protocol ProductsListPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ProductsListViewProtocol? { get set }
    var interactor: ProductsListInteractorInputProtocol? { get set }
    var wireFrame: ProductsListWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func fecthMoreData()
}

protocol ProductsListInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func productsResponse(products: [ProductsModel])
}

protocol ProductsListInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ProductsListInteractorOutputProtocol? { get set }
    var localDatamanager: ProductsListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ProductsListRemoteDataManagerInputProtocol? { get set }
    
    func fetchProducts(product: String, page: Int)
    func fetchMoreData()
}

protocol ProductsListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ProductsListRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ProductsListRemoteDataManagerOutputProtocol? { get set }
    
    func fetchProducts(product: String, page: Int)
}

protocol ProductsListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func productsResponse(products: [ProductsModel])
}

protocol ProductsListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
