//
//  Photomemo+CoreDataProperties.swift
//  MemoWithCollectionView
//
//  Created by 한병두 on 2018. 6. 18..
//  Copyright © 2018년 Byungdoo Han. All rights reserved.
//
//

import Foundation
import CoreData


extension Photomemo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photomemo> {
        return NSFetchRequest<Photomemo>(entityName: "Photomemo")
    }

    @NSManaged public var contents: String?
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var title: String?

}
