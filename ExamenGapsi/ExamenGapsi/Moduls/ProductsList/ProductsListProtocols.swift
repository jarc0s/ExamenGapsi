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
}

protocol ProductsListInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol ProductsListInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ProductsListInteractorOutputProtocol? { get set }
    var localDatamanager: ProductsListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ProductsListRemoteDataManagerInputProtocol? { get set }
}

protocol ProductsListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ProductsListRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ProductsListRemoteDataManagerOutputProtocol? { get set }
}

protocol ProductsListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ProductsListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
