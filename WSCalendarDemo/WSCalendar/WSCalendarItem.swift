//
//  WSCalendarCollectionCell.swift
//  WSCalendarDemo
//
//  Created by WS on 2017/5/31.
//  Copyright © 2017年 WS. All rights reserved.
//

import UIKit


protocol WSCalendarItemDelegate: class {
    func calendarItemDidTapped(_ calendarItem: WSCalendarItem, viewId: String)
}

class WSCalendarItem: UIView {
    
    public var selectArr: [WSCalendarItem]?
    
    public var calendarDate: WSCalendarDate! {
        didSet {
            
            let timeStr = calendarDate.dateString as NSString
            titleButton.setTitle(timeStr.substring(from: 6), for: .normal)
            
            configTitleButton()
        }
    }
    
    open weak var calendarDelegate: WSCalendarItemDelegate?

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
        titleButton.addTarget(self, action: #selector(titleButtonDidTapped(sender:)), for: .touchUpInside)
        self.addSubview(titleButton)
        self.backgroundColor = WSCalendarConfig.itemBackgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleButton.frame = self.bounds
    }
    
    private func configTitleButton() {
        switch calendarDate.selectState {
        case .defaultSelect:
            titleButton.setTitleColor(WSCalendarConfig.itemDefaultSelectTextColor, for: .normal)
            titleButton.ws_setBackgroundColor(WSCalendarConfig.itemDefaultSelectBgColor, for: .normal)
        case .normal:
            titleButton.setTitleColor(WSCalendarConfig.itemNomalTextColor, for: .normal)
            titleButton.ws_setBackgroundColor(WSCalendarConfig.itemBackgroundColor, for: .normal)
        case .selected:
            changeToSelect()
        case .unSelect:
            changeToUnSelect()
        case .unSelectable:
            titleButton.setTitleColor(WSCalendarConfig.itemUnSelectableTextColor, for: .normal)
            titleButton.ws_setBackgroundColor(WSCalendarConfig.itemBackgroundColor, for: .normal)
        }
        
    }
    
    private func changeToSelect() {
        titleButton.ws_setBackgroundColor(WSCalendarConfig.itemSelectBgColor, for: .normal)
        titleButton.setTitleColor(WSCalendarConfig.itemSelectTextColor, for: .normal)
    }
    
    private func changeToUnSelect() {
        titleButton.ws_setBackgroundColor(WSCalendarConfig.itemBackgroundColor, for: .normal)
        titleButton.setTitleColor(WSCalendarConfig.itemNomalTextColor, for: .normal)
    }
    
//MARK:- tapped response
    @objc private func titleButtonDidTapped(sender: UIButton) {
        if calendarDate.selectState == .unSelectable { return }
        
        calendarDate.selectState = .selected
        if let delegate = calendarDelegate {
            delegate.calendarItemDidTapped(self, viewId: self.restorationIdentifier!)
        }
    }
    
}

extension UIButton {
    fileprivate func ws_setBackgroundColor(_ color: UIColor, for state: UIControlState) {
        self.setBackgroundImage(ws_getImage(color), for: state)
    }
    
    private func ws_getImage(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
