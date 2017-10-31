//
//  ThirdWeekOneFlowLayout.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/10/31.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

let kcellNumberOfOneRow = 4
let kcellRow = 2


class ThirdWeekOneFlowLayout: UICollectionViewFlowLayout {
    // 保存所有item
    fileprivate var attributesArr:[UICollectionViewLayoutAttributes] = []
    // MARK: - 重新布局
    override func prepare() {
        super.prepare()
        
        let itemWH:CGFloat = kWidth / CGFloat(kcellNumberOfOneRow)
        
        // 设置itemSize
        itemSize = CGSize.init(width: itemWH, height: itemWH)
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
        scrollDirection = .horizontal
        
        // 设置collectionView属性
        collectionView?.isPagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.contentInset = UIEdgeInsetsMake(10, 10, 10, 10)
        
        var page = 0
        let itemsCount = collectionView?.numberOfItems(inSection: 0) ?? 0
        for itemIndex in 0..<itemsCount {
            
            let indexPath = IndexPath.init(item: itemIndex, section: 0)
            let attributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
            
            page = itemIndex / (kcellNumberOfOneRow * kcellRow)
            // 计算得到x,y值
            let x = itemSize.width * CGFloat(itemIndex % Int(kcellNumberOfOneRow)) + (CGFloat(page) * kWidth)
            let y = itemSize.height * CGFloat((itemIndex - page * kcellRow * kcellNumberOfOneRow) / kcellNumberOfOneRow)
            
            
        }
        
        
    }
    
}
