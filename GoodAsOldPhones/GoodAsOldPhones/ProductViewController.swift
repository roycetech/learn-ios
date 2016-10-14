//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Royce on 14/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productNameLabel.text = product?.name
        if let productImage = product?.productImage {
            productImageView.image = UIImage(named: productImage)
        }
    }

}
