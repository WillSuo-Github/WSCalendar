//
//  WSCalendarView.swift
//  WSCalendarDemo
//
//  Created by WS on 2017/5/31.
//  Copyright © 2017年 WS. All rights reserved.
//

import UIKit

class WSCalendarView: UIView {
    
    fileprivate let sourceArr: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
    
    private var collectionView: UICollectionView!
    
//MARK:- life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .red
        
        configSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK:- layout
    
    private func configSubViews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        self.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "WSCalendarCollectionCell", bundle: nil), forCellWithReuseIdentifier: "WSCalendarCollectionCell")
        collectionView.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 229/255.0, alpha: 1)
    }
    
    fileprivate func updateCollectionViewFrame(_ width: Double,_ height: Double) {
        collectionView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.bounds.size.height = CGFloat(height)
    }
}

extension WSCalendarView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sourceArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WSCalendarCollectionCell", for: indexPath) as! WSCalendarCollectionCell
        
        cell.titleText = sourceArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = Double(collectionView.bounds.size.width) / 7
        
        updateCollectionViewFrame(cellWidth * 7, cellWidth * ceil(Double(sourceArr.count) / 7.0))
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
}
