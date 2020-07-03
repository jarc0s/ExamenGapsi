//
//  SearchListProtocols.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

protocol SearchListViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: SearchListPresenterProtocol? { get set }
    func dismissView()
}

protocol SearchListWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createSearchListModule(presenterProducts: ProductsListPresenter) -> UIViewController
}

protocol SearchListPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: SearchListViewProtocol? { get set }
    var interactor: SearchListInteractorInputProtocol? { get set }
    var wireFrame: SearchListWireFrameProtocol? { get set }
    var parentProtocol: SearchListToParentViewProtocol? { get set }
    
    func viewDidLoad()
    func searchProducts(productName: String)
}

protocol SearchListInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol SearchListInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: SearchListInteractorOutputProtocol? { get set }
    var localDatamanager: SearchListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SearchListRemoteDataManagerInputProtocol? { get set }
}

protocol SearchListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol SearchListRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SearchListRemoteDataManagerOutputProtocol? { get set }
}

protocol SearchListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol SearchListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}

protocol SearchListToParentViewProtocol: class {
    //func performSegueToDetail(content: ContentModel)
    func performSearchForProduct(product: String)
}
