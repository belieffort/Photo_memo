
//
//  AddViewController.swift
//  MemoWithCollectionView
//
//  Created by 한병두 on 2018. 6. 8..
//  Copyright © 2018년 Byungdoo Han. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btnImage: UIButton!
    @IBOutlet var text_title: UITextField!
    @IBOutlet var text_contents: UITextView!
    
    var mainViewController = ViewController()

    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text_contents!.layer.borderWidth = 0.5
        text_contents!.layer.borderColor = UIColor.lightGray
            .cgColor
        text_contents!.layer.cornerRadius = 5.0

        // Do any additional setup after loading the view.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func btnImageEdit(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        _ = imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func btnImageDelete(_ sender: Any) {
        imageView.image = nil
        btnImage.isHidden = false
    }
    
    @IBAction func btnDone(_ sender: Any) {
        let title = text_title.text
        let contents = text_contents.text

        let photomemo = Photomemo(context: context)
       
        photomemo.title = title
        photomemo.contents = contents
        photomemo.createdAt = NSDate()
        appDelegate.saveContext()
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            self.image = image
            self.dismiss(animated: true, completion: nil)
            btnImage.isHidden = true
            return self.createCellItem(with: image)
        }
    }
    func createCellItem (with image:UIImage) {
        
        let photoItem = Photomemo(context: mainViewController.managedObjectContext)
        photoItem.photo = NSData(data: UIImagePNGRepresentation(image)!)
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


