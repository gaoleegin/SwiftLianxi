//
//  MainTabBar.swift
//  SwiftLianxi
//
//  Created by 高李军 on 15/10/19.
//  Copyright © 2015年 LJLianXi. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {
    
    let buttonCount = 5
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let w = bounds.size.width / CGFloat(buttonCount)
        let h = bounds.size.height
        let frame = CGRectMake(0, 0, w, h)
        
        var index = 0
        
        for v in subviews as [UIView]{
            if v is UIControl && !(v is UIButton){
                v.frame = CGRectOffset(frame, CGFloat(index) * w , 0)
                index += (index == 1) ? 2: 1
            }
        }
        plusBtn.frame = frame
        
        //center是相对于父视图
        plusBtn.center = CGPointMake(bounds.size.width * 0.5, bounds.size.height * 0.5)
        
}
    
    /// 添加中间的加
    lazy var plusBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState:UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState:UIControlState.Normal)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState:UIControlState.Selected)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState:UIControlState.Selected)
        
        self.addSubview(btn)
        return btn
    }()
    
}
