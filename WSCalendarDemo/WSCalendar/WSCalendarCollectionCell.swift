//
//  WSCalendarCollectionCell.swift
//  WSCalendarDemo
//
//  Created by WS on 2017/5/31.
//  Copyright © 2017年 WS. All rights reserved.
//

import UIKit

class WSCalendarCollectionCell: UICollectionViewCell {
    
    public var calendarDate: WSCalendarDate! {
        didSet {
            
            let timeStr = calendarDate.dateString as NSString
            titleLabel.text = timeStr.substring(from: 6)
            if calendarDate.isSelectable {
                self.titleLabel.textColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1)
            }else{
                self.titleLabel.textColor = UIColor(red: 180/255.0, green: 180/255.0, blue: 180/255.0, alpha: 1)
            }
            
            if calendarDate.isSelect {
                changeToSelect()
            }
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    
//MARK:- life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
        titleLabel.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
    }

    private func changeToSelect() {
        self.titleLabel.backgroundColor = .red
    }
    
}
