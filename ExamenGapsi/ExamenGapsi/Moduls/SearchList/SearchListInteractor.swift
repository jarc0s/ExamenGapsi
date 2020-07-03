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

}

extension SearchListInteractor: SearchListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
