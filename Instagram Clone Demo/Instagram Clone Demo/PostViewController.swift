//
//  PostViewController.swift
//  Instagram Clone Demo
//
//  Created by Royce on 28/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    var parseService: ParseContext!
    var activityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var imageToPost: UIImageView!
    @IBOutlet weak var textFieldMessage: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonChooseImageTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func ignoreEvents() {
        activityIndicator = UIActivityIndicatorView(
            frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }

    @IBAction func buttonPostImageTapped(_ sender: UIButton) {
        ignoreEvents()
        if let image = imageToPost.image {
            parseService.postImage(
                image: image,
                message: textFieldMessage.text,
                onerror: {(error) in
                    Alerter.create(controller: self,
                                   title: "Could not post image",
                                   message: "Please try again later")
                },
                onsuccess: {() in
                    Alerter.create(controller: self,
                                   title: "Image Posted!",
                                   message: "Your image has been posted successfully")
                    
                    self.textFieldMessage.text = ""
                    self.imageToPost.image = UIImage(named: "blank-person.png")
                },
                oncomplete: {() in
                    print("Post completed!")
                    UIApplication.shared.endIgnoringInteractionEvents()
                    self.activityIndicator.stopAnimating()
                }
            )
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageToPost.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
}
