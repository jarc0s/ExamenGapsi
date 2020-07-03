//
//  SearchListInteractor.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class SearchListInteractor: SearchListInteractorInputProtocol {
    
    

    // MARK: Properties
    weak var presenter: SearchListInteractorOutputProtocol?
    var localDatamanager: SearchListLocalDataManagerInputProtocol?
    var remoteDatamanager: SearchListRemoteDataManagerInputProtocol?
    
    func storeProductNameOnLocal(productName: String) {
        localDatamanager?.storeParameter(productName: productName)
    }
    
    func fetchProductNamesFromLocal() {
        let parameters = localDatamanager?.fetchParameters()
        presenter?.currentParameters(parameters: parameters ?? [])
    }

}

extension SearchListInteractor: SearchListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
