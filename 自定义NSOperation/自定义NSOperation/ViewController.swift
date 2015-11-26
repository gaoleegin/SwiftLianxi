//
//  ViewController.swift
//  自定义NSOperation
//
//  Created by 高李军 on 15/11/26.
//  Copyright © 2015年 高李军. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func btnClicked() {
        print("已经被刮起了")
        blockOperationQueue.suspended = true
        
    }
    
    /// 这个就是懒加载
    lazy var blockOperationQueue:NSOperationQueue = {
        return NSOperationQueue()
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func loaImage(){
        
         for _ in 1...10{
          //如果在这里睡眠，就是在主线程上睡眠，如果在里面睡眠就是当前的线程上面睡眠
         blockOperationQueue.maxConcurrentOperationCount = 2
        let blockOperation:NSBlockOperation = NSBlockOperation { () in
            NSThread.sleepForTimeInterval(2.0)
            print(NSThread.currentThread())
        }
        
        blockOperationQueue.addOperation(blockOperation)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        loaImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //现在需要解决的是激情

}

