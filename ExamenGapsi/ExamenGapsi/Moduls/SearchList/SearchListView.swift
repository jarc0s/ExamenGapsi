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

    // MARK: Properties
    var presenter: SearchListPresenterProtocol?
    @IBOutlet weak var textField: UITextField!
    
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
}


extension SearchListView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.presenter?.searchProducts(productName: textField.text ?? "")
        return true
    }
}
