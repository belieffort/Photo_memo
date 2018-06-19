//
//  ViewController.swift
//  MemoWithCollectionView
//
//  Created by 한병두 on 2018. 6. 1..
//  Copyright © 2018년 Byungdoo Han. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, NSFetchedResultsControllerDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var controller : NSFetchedResultsController<Photomemo>!
    
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        var layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 150)/2, height: (self.collectionView.frame.size.height - 210)/3)
        
        fetchPhotomemo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchPhotomemo()
    {
        let fetchRequest : NSFetchRequest<Photomemo> = Photomemo.fetchRequest()
        let dataSort = NSSortDescriptor(key: "createdAt", ascending: false)
        fetchRequest.sortDescriptors = [dataSort]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
        
    }

    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPathForSelectedRow: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPathForSelectedRow) as! CollectionViewCell
        
//        cell.lblTitle.text = titleMemo[indexPath.item]
//        cell.imageView.image = imageMemo[indexPath.item]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        selectedIndexPath = indexPathForSelectedRow
        let photomemo = controller.object(at: indexPathForSelectedRow)
        cell.lblTitle.text = photomemo.title
        
//        print(photomemo.title)

        
        return cell
    }

    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let contentViewController: ContentViewController = segue.destination as! ContentViewController
            let photomemo = controller.object(at: selectedIndexPath!)

                contentViewController.memoTitleLabel.text = photomemo.title
                contentViewController.memoContentsTextView.text = photomemo.contents
        }
    }
}

