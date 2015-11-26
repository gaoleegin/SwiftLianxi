//
//  FirstCustomSegue.swift
//  自定义控制器视图的转场动画_Swift
//
//  Created by 高李军 on 15/11/25.
//  Copyright © 2015年 高李军. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {

    override func perform() {
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width;
        let screenHeight = UIScreen.mainScreen().bounds.size.height;
        
        
        
        
        let firstVCView = self.sourceViewController.view as UIView!
        let secondVCView = self.destinationViewController.view as UIView!
        
        
        secondVCView.frame = CGRectMake(0, screenHeight, screenWidth, screenHeight);

        
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        UIView.animateWithDuration(8, animations: { ()  in
            
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, -screenHeight);
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, -screenHeight);
            

            
            }) { (Finished) in
                self.sourceViewController.presentViewController(self.destinationViewController, animated: false, completion:nil)
        }
        
    }
    
    

    
    
}
