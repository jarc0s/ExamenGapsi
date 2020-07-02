//
//  URLSession+Extension.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import UIKit
import Combine

extension URLSession
{
    func fetchImage(for url: URL, placeholder: UIImage? = nil)
         -> AnyPublisher<UIImage?, Never>
    {
        return dataTaskPublisher(for: url)
            .tryMap { data, response -> UIImage in
                guard let image = UIImage(data: data) else {
                    throw API.APIError.invalidResponse
                }
                return image
            }
            .replaceError(with: placeholder)
            .eraseToAnyPublisher()
    }
}

