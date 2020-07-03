//
//  SearchListLocalDataManager.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class SearchListLocalDataManager:SearchListLocalDataManagerInputProtocol {
    
    func storeParameter(productName: String) {
        let defaults = UserDefaults.standard
        var currentParameters = ""
        if let storedParameters = defaults.string(forKey: "products") {
            currentParameters = storedParameters
        }
        
        currentParameters.append("\(productName)|")
        
        defaults.set(currentParameters, forKey: "products")
    }
    
    func fetchParameters() -> [String]{
        let defaults = UserDefaults.standard
        guard var storedParameters = defaults.string(forKey: "products") else { return [] }
        return storedParameters.dropLast().components(separatedBy: "|")
        
    }
    
    
    
    
}
