//
//  ProductsListWireFrame.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class ProductsListWireFrame: ProductsListWireFrameProtocol {

    class func createProductsListModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ProductsListView")
        if let view = viewController as? ProductsListView {
            let presenter: ProductsListPresenterProtocol & ProductsListInteractorOutputProtocol & SearchListToParentViewProtocol = ProductsListPresenter()
            let interactor: ProductsListInteractorInputProtocol & ProductsListRemoteDataManagerOutputProtocol = ProductsListInteractor()
            let localDataManager: ProductsListLocalDataManagerInputProtocol = ProductsListLocalDataManager()
            let remoteDataManager: ProductsListRemoteDataManagerInputProtocol = ProductsListRemoteDataManager()
            let wireFrame: ProductsListWireFrameProtocol = ProductsListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ProductsListView", bundle: Bundle.main)
    }
    
    func presentSearchList(presenter: ProductsListPresenter) -> UIViewController {
        let searchList = SearchListWireFrame.createSearchListModule(presenterProducts: presenter)
        return searchList
    }
    
}
