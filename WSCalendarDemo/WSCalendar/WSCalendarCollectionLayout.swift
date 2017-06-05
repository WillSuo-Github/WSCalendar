//
//  WSCalendarCollectionLayout.swift
//  WSCalendarDemo
//
//  Created by WS on 2017/6/5.
//  Copyright © 2017年 WS. All rights reserved.
//

import UIKit

class WSCalendarCollectionLayout: UICollectionViewFlowLayout {

    var allCol: Int!
    var allRow: Int!
    
    var allAttributes: [[UICollectionViewLayoutAttributes]] = [[UICollectionViewLayoutAttributes]]()
    
    override func prepare() {
        super.prepare()
        
        let sectionCount = self.collectionView!.numberOfSections
        
        for i in 0..<sectionCount {
            
            let rowCount = self.collectionView!.numberOfItems(inSection: i)
            var tmp: [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
            for j in 0..<rowCount {
                let indexpath = IndexPath(row: j, section: i)
                
                if let attribute = self.layoutAttributesForItem(at: indexpath) {
                    tmp.append(attribute)
                }
            }
            allAttributes.append(tmp)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let indexRow = indexPath.row
        
        
        let x = indexRow % allCol
        let y = indexRow / allCol
        
        let attribute = super.layoutAttributesForItem(at: indexPath)
        print("x:\(x)  y:\(y)    \(indexRow) to \(x * allRow + y)")
        
        attribute?.indexPath = IndexPath(item: x  * allRow + y, section: indexPath.section)
        
        return attribute
    }
    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        let attribute =  super.layoutAttributesForElements(in: rect)
//        return attribute
//    }
}
