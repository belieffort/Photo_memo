//
//  CollectionViewCell.swift
//  MemoWithCollectionView
//
//  Created by 한병두 on 2018. 6. 1..
//  Copyright © 2018년 Byungdoo Han. All rights reserved.
//

import UIKit
import CoreData


protocol DataCollectionProtocol {
    func deleteData(indx: Int)
}


class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblTitle: UILabel!
        
    var delegate : DataCollectionProtocol?
    var index : IndexPath?
    
    
    @IBAction func btnDelete(_ sender: Any) {
        delegate?.deleteData(indx: (index?.item)!)


    }
    
}

