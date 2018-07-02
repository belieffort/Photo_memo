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
    
    var photomemo:Photomemo?

    var titleBox = ""
    var contentBox = ""
    var imageBox : UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        memoTitleLabel.text = photomemo?.title
//        memoContentsTextView.text = photomemo?.contents
        
        memoTitleLabel.text = titleBox
        memoContentsTextView.text = contentBox
        memoImageView.image = imageBox
        
  
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDelete(_ sender: Any) {
//        context.delete(photomemo!)
//        appDelegate.saveContext()
//        _ = navigationController?.popViewController(animated: true)
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
