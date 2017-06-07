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
                self.titleLabel.textColor =  WSCalendarConfig.itemNomalTextColor
            }else{
                self.titleLabel.textColor = WSCalendarConfig.itemUnSelectableTextColor
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
        titleLabel = UILabel(frame: self.bounds)
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
        self.backgroundColor = WSCalendarConfig.itemBackgroundColor
        titleLabel.backgroundColor = WSCalendarConfig.itemBackgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = self.bounds
    }
    
    private func changeToSelect() {
        self.titleLabel.backgroundColor = .red
    }
    
    private func changeToUnSelect() {
        self.titleLabel.backgroundColor = WSCalendarConfig.itemBackgroundColor
    }
    
}
