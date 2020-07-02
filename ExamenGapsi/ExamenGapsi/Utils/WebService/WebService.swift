//
//  WebService.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import Combine

class WebService {
    
    func fectProducts(product: String, page: Int) -> AnyPublisher<[ProductsModel],Error> {
        
        guard let url = URL(string: Constants.URLs.product(product: product, page: page)) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
        .map(\.data)
        .decode(type: ProductsResponse.self, decoder: JSONDecoder())
            .map { $0.plpResults.records }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher() // --> you return a publisher when you call the map it is going to box that particular publisher and return it which means that it's not really going to return to a particular publisher it can be employed
        
    }
    
}
