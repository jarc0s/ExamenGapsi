//
//  APIError.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class API
{
    enum APIError: Error
    {
        /// Network error from URLSession.
        case networkError(Error)
        
        /// HTTP status error.
        case httpStatusError(statusCode: Int)
        
        /// Invalid data returned by server.
        case invalidResponse
    }
}
