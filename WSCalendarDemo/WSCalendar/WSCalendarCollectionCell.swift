//
//  WSCalendarCollectionCell.swift
//  WSCalendarDemo
//
//  Created by WS on 2017/5/31.
//  Copyright © 2017年 WS. All rights reserved.
//

import UIKit

class WSCalendarCollectionCell: UICollectionViewCell {
    
    public var titleText: String = "" {
        didSet {
            self.titleLabel.text = titleText
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    
//MARK:- life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 229/255.0, alpha: 1)
    }


    
}
