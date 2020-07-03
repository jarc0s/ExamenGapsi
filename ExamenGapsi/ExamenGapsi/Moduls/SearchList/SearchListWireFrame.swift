//
//  SearchListWireFrame.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class SearchListWireFrame: SearchListWireFrameProtocol {

    class func createSearchListModule(presenterProducts: ProductsListPresenter) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SearchListView")
        if let view = viewController as? SearchListView {
            let presenter: SearchListPresenterProtocol & SearchListInteractorOutputProtocol = SearchListPresenter()
            let interactor: SearchListInteractorInputProtocol & SearchListRemoteDataManagerOutputProtocol = SearchListInteractor()
            let localDataManager: SearchListLocalDataManagerInputProtocol = SearchListLocalDataManager()
            let remoteDataManager: SearchListRemoteDataManagerInputProtocol = SearchListRemoteDataManager()
            let wireFrame: SearchListWireFrameProtocol = SearchListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.parentProtocol = presenterProducts
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "SearchListView", bundle: Bundle.main)
    }
    
}
