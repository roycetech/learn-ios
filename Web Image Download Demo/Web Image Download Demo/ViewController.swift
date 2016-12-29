//
//  ViewController.swift
//  Web Image Download Demo
//
//  Created by Royce on 24/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let IMAGE_PATH = "/webimage.jpg"
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
        
        if imageView.image == nil {
            fetchImage()
        }
    }

    func fetchImage() {
        /* Attribution:  This image was originally posted to Flickr by HenryStradford at http://flickr.com/photos/87341878@N00/3369537457. */
        
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/White_tiger-Gunma_Safari_Park.jpg/440px-White_tiger-Gunma_Safari_Park.jpg")!
        
        print("Requesting Image...")
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                print("Image fetched from web")
                self.imageView.image = image
                self.saveImage(image: image)
            }
        }
        task.resume()
    }
    
    func loadImage() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)

        if documentsPath.count > 0 {
            let documentsDirectory = documentsPath[0]
            let restorePath = documentsDirectory + IMAGE_PATH
            imageView.image = UIImage(contentsOfFile: restorePath)
            print("Image load...")
        }
    }
    
    func saveImage(image: UIImage) {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if documentsPath.count > 0 {
            let documentsDirectory = documentsPath[0]
            let savePath = documentsDirectory + IMAGE_PATH
            try? UIImageJPEGRepresentation(image, 1)?.write(to: URL(fileURLWithPath: savePath))
            print("Image saved")
        }
    }
    
}

