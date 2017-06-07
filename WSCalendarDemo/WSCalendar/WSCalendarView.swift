//
//  WSCalendarView.swift
//  WSCalendarDemo
//
//  Created by WS on 2017/5/31.
//  Copyright © 2017年 WS. All rights reserved.
//

import UIKit

class WSCalendarView: UIView {
    
    fileprivate var sourceArr: [[WSCalendarViewModule]]!
    
    fileprivate var scrollView: UIScrollView!
    
    
    
//MARK:- life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .red
        
        configSourceArr()
        configSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK:- layout
    
    private func configSubViews() {
        
        scrollView = UIScrollView(frame: self.bounds)
        self.addSubview(scrollView)
        
        configScrollViewCell()
    }

    private func configScrollViewCell() {
        for i in 0..<sourceArr.count {
            for j in 0..<sourceArr[i].count {
                let itemModule = sourceArr[i][j]
                let itemView = WSCalendarItem(frame: itemModule.frame)
                itemView.calendarDate = itemModule.calendarDate
                scrollView.addSubview(itemView)
            }
        }
    }
    
//MARK:- other
    private func configSourceArr() {
        sourceArr = WSCalendarViewModule.getAllModules(scrollViewWidth: self.bounds.size.width)
    }
    
    private func getAllRows() -> [Int] {
        var tmpArr: [Int] = [Int]()
        for i in 0..<sourceArr.count {
            tmpArr.append(sourceArr[i].count / 7)
        }
        return tmpArr
    }
}


