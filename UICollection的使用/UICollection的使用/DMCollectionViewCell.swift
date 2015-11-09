//
//  DMCollectionViewCell.swift
//  UICollection的使用
//
//  Created by 高李军 on 15/11/9.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

//定义通知
let DMButonClicked = "DMButonClicked"

class DMCollectionViewCell: UICollectionViewCell {
    
    
    // 点击按钮出发的事件
    @IBAction func buttonClicked() {
        
        
        //发出通知
        NSNotificationCenter.defaultCenter().postNotificationName(DMButonClicked, object: self)
        
        print("\(__FUNCTION__)")
        
    }
    
    
    
}
