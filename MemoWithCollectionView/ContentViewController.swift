//
//  ContentViewController.swift
//  MemoWithCollectionView
//
//  Created by 한병두 on 2018. 6. 16..
//  Copyright © 2018년 Byungdoo Han. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet var memoImageView: UIImageView!
    @IBOutlet var memoTitleLabel: UILabel!
    @IBOutlet var memoContentsTextView: UITextView!

    var photomemo : Photomemo!
    var viewcontroller = ViewController()

//    var titleBox = ""
//    var contentBox = ""
//    var imageBox : UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        memoTitleLabel.text = titleBox
//        memoContentsTextView.text = contentBox
//        memoImageView.image = imageBox
        
        memoTitleLabel.text = photomemo.title
        memoContentsTextView.text = photomemo.contents
        let changeData = UIImage(data: photomemo.photo! as Data)
        memoImageView.image = changeData
        
        
        self.title = memoTitleLabel.text
  
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Edit" {
        let editViewController: EditViewController = segue.destination as! EditViewController
            editViewController.editImage = memoImageView.image
            editViewController.editTitle = memoTitleLabel.text
            editViewController.editContent = memoContentsTextView.text
        
            photomemo.title = memoTitleLabel.text
            photomemo.contents = memoContentsTextView.text
            let selectedImage = memoImageView.image
            let transferData : Data = UIImagePNGRepresentation(selectedImage!)!
            photomemo.photo = transferData as NSData
            
            editViewController.photomemo = photomemo!

        }

    }
    


 }
