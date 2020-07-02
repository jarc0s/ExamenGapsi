//
//  ProductsListView.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit
import Combine

class ProductsListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var presenter: ProductsListPresenterProtocol?
    var products: [ProductsModel] = [ProductsModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension ProductsListView: ProductsListViewProtocol {
    
    
    // TODO: implement view output methods
    func configTableView() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 90
    }
    
    func updateContentTable(products: [ProductsModel]) {
        self.products = products
    }
}


extension ProductsListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        let contentModel = products[indexPath.row]
        //cell.setContents(title: <#T##String#>, price: <#T##String#>, image: <#T##UIImage#>)
        cell.titleLbl.text = contentModel.productDisplayName
        cell.priceLbl.text = "\(contentModel.promoPrice)"
        if let urlImage = URL(string: contentModel.smImage) {
            cell.configure(with: urlImage)
        }
            
        return cell
    }
    
    
}
