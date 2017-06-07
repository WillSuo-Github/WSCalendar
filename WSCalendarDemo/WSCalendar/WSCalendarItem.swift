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
            titleButton.setTitle(timeStr.substring(from: 6), for: .normal)
            if calendarDate.isSelectable {
                titleButton.setTitleColor(WSCalendarConfig.itemNomalTextColor, for: .normal)
            }else{
                titleButton.setTitleColor(WSCalendarConfig.itemUnSelectableTextColor, for: .normal)
            }
            
            if calendarDate.isSelect {
                changeToSelect()
            }else{
                changeToUnSelect()
            }
        }
    }

    private var titleButton: UIButton!
    
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
        titleButton = UIButton(type: .custom)
        self.addSubview(titleButton)
        self.backgroundColor = WSCalendarConfig.itemBackgroundColor
        titleButton.backgroundColor = WSCalendarConfig.itemBackgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleButton.frame = self.bounds
    }
    
    private func changeToSelect() {
        self.titleButton.backgroundColor = .red
    }
    
    private func changeToUnSelect() {
        self.titleButton.backgroundColor = WSCalendarConfig.itemBackgroundColor
    }
    
}
