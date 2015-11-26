//
//  LJOperation.swift
//  自定义NSOperation
    
//  Created by 高李军 on 15/11/26.
//  Copyright © 2015年 高李军. All rights reserved.
//

import UIKit

class LJOperation: NSOperation {
    
    
    class func downImage(urlString:String,finshed:(imge:UIImage)->())->LJOperation{
        
        let op = LJOperation()
    
        op.urlString = urlString
        op.finshed = finshed
        
        return op
        
    }
    
    
    var urlString:String?
    
    var finshed:((image:UIImage)->())?
    
    
    
    
    override func main() {
        
        print(NSThread.currentThread())
        print("已经调用了")
        

        assert(1 == 3, "不可以从这里") ///这就是一个断言，如果不满足条件
        
        let imageData = NSData(contentsOfURL: NSURL(string: self.urlString!)!)
        
        let image:UIImage = UIImage(data: imageData!)!
        
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            self.finshed!(image: image)
        }
        
        //print(self.urlString)
    }

}
