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
    public init(frame: CGRect, config: WSCalendarConfig) {
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
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
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
        
        scrollView.contentSize = CGSize(width: scrollView.bounds.size.width * CGFloat(sourceArr.count), height: scrollView.bounds.size.height)
    }
    
    fileprivate func updateScrollViewFrame(_ width: CGFloat, _ height: CGFloat) {
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: width, height: height)
        scrollView.frame = self.bounds
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


extension WSCalendarView: UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print(11)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = lroundf(Float(scrollView.contentOffset.x / scrollView.bounds.size.width))
        let itemRow = sourceArr[index].count / 7
        
        if let itemSize = WSCalendarConfig.itemSize {
            let height = CGFloat(itemRow) * itemSize.height + CGFloat(itemRow - 1) * WSCalendarConfig.itemSpacing + WSCalendarConfig.scrollEdgeInset.top + WSCalendarConfig.scrollEdgeInset.bottom
            updateScrollViewFrame(scrollView.bounds.size.width, height)
        }
        
    }
}

