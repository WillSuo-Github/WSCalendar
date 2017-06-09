//
//  ViewController.swift
//  WSCalendarDemo
//
//  Created by WS on 2017/5/31.
//  Copyright © 2017年 WS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configSubViews()
    }

//MARK:- layout
    private func configSubViews() {
        
        let calendarView = WSCalendarView(frame: CGRect(x: 0, y: 100, width: view.bounds.size.width, height: 300), config: WSCalendarConfig())
        calendarView.calendarDelegate = self
        view.addSubview(calendarView)
    }


}


extension ViewController: WSCalendarViewDelegate {
    func didSelectDate(calendarDate: WSCalendarDate) {
        print(calendarDate.date)
    }
    
    func didShowMonth(currentMonth: Int) {
        print("当前是\(currentMonth)月")
    }
}

