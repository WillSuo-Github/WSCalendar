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
    public let lastSelectableDate: Date = Date()
    
//MARK:- private property
    private let calendar: Calendar = Calendar(identifier: .gregorian)
    let dateFormatter = DateFormatter()

//MARK:- public func
    public func getAllDate() -> [WSCalendarDate] {
        
        return getDaysInMonth(disableScrollingBeforeDate)
    }
    
    init() {
        lastSelectableDate = getDate(Date(), 10)
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
        
        
        dateFormatter.dateFormat = "yyyyMM"
        let nowDateBaseStr = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "yyyyMMdd"
        let nowDateStr = dateFormatter.string(from: date)
        
        var tmpArr: [WSCalendarDate] = [WSCalendarDate]()
        
        let maxSelectableDays = getDayNum(disableScrollingBeforeDate, lastSelectableDate)
        let currentMonthDays = getNumberOfDaysInMonth(date)
        //当月的第一天和最后一天
        var firstDate: WSCalendarDate! ,lastDate: WSCalendarDate!
        
        
        for i in 1...currentMonthDays {
            let str = nowDateBaseStr.appending(String(format: "%02d", i))
            let tmpDate = dateFormatter.date(from: str)!
            var calendarDate: WSCalendarDate = WSCalendarDate(date: tmpDate, dateString: str, isSelectable: false, isSelect: false)
            
            //特殊的日子判断
            if (str == nowDateStr) {
                calendarDate.isSelect = true
                calendarDate.isSelectable = true
            }else if(str > nowDateStr){
                calendarDate.isSelectable = true
            }
            
            //超出的日期
            if i > maxSelectableDays {
                calendarDate.isSelectable = false
            }
            
            //收尾的天数
            if i == 1 {
                firstDate = calendarDate
            }else if i == currentMonthDays {
                lastDate = calendarDate
            }
            
            tmpArr.append(calendarDate)
        }
        
        return insertDaysAtBothEnds(firstDate, lastDate, tmpArr)
    }
    
    private func getDayNum(_ date: Date,_ betweenDate: Date) -> Int {
        let result = calendar.dateComponents([.day], from: date, to: betweenDate)

        return result.day ?? 0
    }
    
    private func insertDaysAtBothEnds(_ fromDate:WSCalendarDate,_ toDate:WSCalendarDate, _ dataArr:[WSCalendarDate]) -> [WSCalendarDate]{
        
        let fromWeekIndex = calendar.dateComponents([.weekday], from: fromDate.date).weekday
        let toWeekIndex = calendar.dateComponents([.weekday], from: toDate.date).weekday
        
        
        if let fromIndex = fromWeekIndex {
            for i in 1..<fromIndex {
                let date = getDate(fromDate.date, i - fromIndex)
                WSCalendarDate(date:date , dateString: getDateStr(date), isSelectable: false, isSelect: false)
            }
        }
        
        
        return dataArr
    }
    
    private func getDate(_ date: Date,_ offset:Int) -> Date{
        var dayComponents = DateComponents()
        dayComponents.day = offset
        let calendar = Calendar(identifier: .gregorian)
        if let lastDate = calendar.date(byAdding: dayComponents, to: date) {
            return lastDate
        } else {
            return Date()
        }
    }
    
    private func getDateStr(_ date: Date) -> String {
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
    }
}
