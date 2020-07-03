//
//  Constants.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

struct Constants {
    
    struct URLs {
        static func product(product: String, page: Int) -> String {
            "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?force-plp=true&search-string=\(product)&page-number=\(page)&number-of-items-per-page=25".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
    }
}
