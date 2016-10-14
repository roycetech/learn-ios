//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Royce on 14/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit


class ProductsTableViewController: UITableViewController {

    var products: [Product] = [
        Product(name: "1907 Wall Set", productImage: "phone-fullscreen1", cellImage: "image-cell1"),
        Product(name: "1921 Dial Phone", productImage: "phone-fullscreen2", cellImage: "image-cell2"),
        Product(name: "1937 Desk Phone", productImage: "phone-fullscreen3", cellImage: "image-cell3"),
        Product(name: "1984 Motorola Portable", productImage: "phone-fullscreen4", cellImage: "image-cell4")
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell")!
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        if let i = product.cellImage {
            cell.imageView?.image = UIImage(named: i)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Product" {
            let destinationCtrl = segue.destination as? ProductViewController
            
            guard let tappedCell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: tappedCell) else {
                    return
            }
            destinationCtrl?.product = products[indexPath.row]
        }
    }

}
