//
//  ProductsListView.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class ProductsListView: UIViewController {

    // MARK: Properties
    var presenter: ProductsListPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension ProductsListView: ProductsListViewProtocol {
    // TODO: implement view output methods
}
