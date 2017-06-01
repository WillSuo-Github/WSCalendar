//
//  WSCalendarTool.swift
//  WSCalendarDemo
//
//  Created by WS on 2017/6/1.
//  Copyright © 2017年 WS. All rights reserved.
//

import UIKit


struct WSCalendarDate {
    
    var date: Date
    var dateString: String
    var isSelectable: Bool
    var isSelect: Bool
}

class WSCalendarTool {

//MARK:- public property
    public let disableScrollingBeforeDate: Date = Date()
    public let lastSelectableDate: Date = {
        var dayComponents = DateComponents()
        dayComponents.day = 70
        let calendar = Calendar(identifier: .gregorian)
        if let lastDate = calendar.date(byAdding: dayComponents, to: Date()) {
            return lastDate
        } else {
            return Date()
        }
    }()
    
//MARK:- private property
    private let calendar: Calendar = Calendar(identifier: .gregorian)

//MARK:- public func
    public func getAllDate() -> [WSCalendarDate] {
        
        return getDaysInMonth(disableScrollingBeforeDate)
    }

//MARK:- private func
    private func getNumberOfDaysInMonth(_ date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)
        
        if let range = range {
            return range.count
        }else{
            return 0
        }
    }
    
    private func getDaysInMonth(_ date: Date) -> [WSCalendarDate] {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMM"
        let nowDateBaseStr = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "yyyyMMdd"
        let nowDateStr = dateFormatter.string(from: date)
        
        var tmpArr: [WSCalendarDate] = [WSCalendarDate]()
        
        for i in 1...getNumberOfDaysInMonth(date) {
            let str = nowDateBaseStr.appending(String(format: "%02d", i))
            let tmpDate = dateFormatter.date(from: str)!
            var calendarDate: WSCalendarDate = WSCalendarDate(date: tmpDate, dateString: str, isSelectable: false, isSelect: false)
            
            if (str == nowDateStr) {
                calendarDate.isSelect = true
                calendarDate.isSelectable = true
            }else if(str > nowDateStr){
                calendarDate.isSelectable = true
            }
            
            tmpArr.append(calendarDate)
        }
        
        return tmpArr
    }
}
