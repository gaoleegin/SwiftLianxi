//
//  ViewController.swift
//  冒泡排序
//
//  Created by 高李军 on 15/10/27.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //bubbleSort([1,2,4,3,2,])
        print(bubbleSort([2,3,6,4,2,8]))
        
}
    /// 冒泡排序
    private func bubbleSort(var fromArray:[Int])->(NSArray){
    
        for var i = 0;i<fromArray.count;i++ {
            for var j = 0;j<fromArray.count-i-1;j++ {
                if fromArray[j]<fromArray[j+1]{
                    let temp = fromArray[j]
                    fromArray[j] = fromArray[j+1]
                    fromArray[j+1] = temp
                }
            }
        }
        
        return fromArray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

