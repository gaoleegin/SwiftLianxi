//
//  FirstCustomSegueUnwind.swift
//  自定义控制器视图的转场动画_Swift
//
//  Created by 高李军 on 15/11/25.
//  Copyright © 2015年 高李军. All rights reserved.


import UIKit

class FirstCustomSegueUnwind: UIStoryboardSegue {

    
    override func perform() {
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        var secondVCView = self.sourceViewController.view as UIView!
        
        var firstVCView = self.destinationViewController.view as UIView!
        
        let window = UIApplication.sharedApplication().keyWindow
        
        window?.insertSubview(firstVCView, aboveSubview: secondVCView)
        
        
    }
    
}
