//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by Royce on 14/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation

class Product {

    var name: String?
    var productImage: String?
    var cellImage: String?
    
    public init(name: String, productImage: String, cellImage: String) {
        self.name = name
        self.productImage = productImage
        self.cellImage = cellImage
    }
    
}
