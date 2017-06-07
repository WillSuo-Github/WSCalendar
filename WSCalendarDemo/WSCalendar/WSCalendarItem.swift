//
//  WSCalendarCollectionCell.swift
//  WSCalendarDemo
//
//  Created by WS on 2017/5/31.
//  Copyright © 2017年 WS. All rights reserved.
//

import UIKit

class WSCalendarItem: UIView {
    
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
            }else{
                changeToUnSelect()
            }
        }
    }

    private var titleLabel: UILabel!
    
//MARK:- life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//MARK:- layout
    private func configSubviews() {
        titleLabel = UILabel(frame: self.frame)
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
        backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
        titleLabel.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = self.bounds
    }
    
    private func changeToSelect() {
        self.titleLabel.backgroundColor = .red
    }
    
    private func changeToUnSelect() {
        self.titleLabel.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
    }
    
}
