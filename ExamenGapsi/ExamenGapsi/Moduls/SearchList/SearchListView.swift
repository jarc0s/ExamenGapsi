//
//  SearchListView.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class SearchListView: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    var products: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: Properties
    var presenter: SearchListPresenterProtocol?
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    
    
    @IBAction func closeModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SearchListView: SearchListViewProtocol {
    // TODO: implement view output methods
    func dismissView() {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateContentTable(products: [String]) {
        self.products = products
    }
}


extension SearchListView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.presenter?.searchProducts(productName: textField.text ?? "")
        return true
    }
}


extension SearchListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchProductCell", for: indexPath) as! SearchProductTableViewCell
        let productName = products[indexPath.row]
        cell.titleLbl.text = productName
            
        return cell
    }
}

extension SearchListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productName = products[indexPath.row]
        self.presenter?.searchProducts(productName: productName)
    }
}
