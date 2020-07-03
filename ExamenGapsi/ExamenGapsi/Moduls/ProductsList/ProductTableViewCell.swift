//
//  ProductTableViewCell.swift
//  ExamenGapsi
//
//  Created by Juan Arcos on 02/07/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit
import Combine

class ProductTableViewCell: UITableViewCell
{
    
    
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    
    private var subscriber: AnyCancellable?
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        subscriber?.cancel()
    }
    
    func setContents(title: String, price: String, image: UIImage) {
        thumbnail.image = image
        titleLbl.text = title
        priceLbl.text = price
    }
    
    func configure(with imageURL: URL)
    {
        subscriber = URLSession.shared.fetchImage(for: imageURL,
                                          placeholder: UIImage(named: "placeholder"))
            .receive(on: DispatchQueue.main)
            .assign(to: \.thumbnail.image, on: self)
    }
    
    
}






