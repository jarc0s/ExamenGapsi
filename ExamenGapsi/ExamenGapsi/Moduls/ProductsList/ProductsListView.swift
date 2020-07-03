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
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var parameterLbl: UILabel!
    
    // MARK: Properties
    var presenter: ProductsListPresenterProtocol?
    var products: [ProductsModel] = [ProductsModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var isFetching: Bool = false
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    @IBAction func actionSearchProduct(_ sender: Any) {
        guard let searchView = presenter?.createSearchListView() else { return }
        searchView.modalPresentationStyle = .overCurrentContext
        present(searchView, animated: true, completion: nil)
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
    
    func updateFetchingState(state: Bool) {
        self.isFetching = state
    }
    
    
    func activityViewState(isVisible: Bool) {
        UIView.animate(withDuration: 0.25, animations: {
            self.activityView.alpha = isVisible ? 1 : 0
        }) { (success) in
            if success {
                self.activityView.isHidden = !isVisible
            }
        }
    }
    
    
    func updateSearchParameter(productName: String) {
        self.parameterLbl.text = productName
    }
    
}


extension ProductsListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        let contentModel = products[indexPath.row]
        cell.titleLbl.text = contentModel.productDisplayName
        cell.priceLbl.text = "\(contentModel.promoPrice)"
        if let urlImage = URL(string: contentModel.smImage) {
            cell.configure(with: urlImage)
        }
            
        return cell
    }
    
    
}

extension ProductsListView: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

    let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.size.height {
            if !isFetching {
                print("get new data")
                presenter?.fecthMoreData()
            }
        }

    }
}
