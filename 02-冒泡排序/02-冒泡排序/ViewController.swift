//
//  ViewController.swift
//  02-冒泡排序
//
//  Created by 高李军 on 15/11/12.
//  Copyright © 2015年 高李军. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bubbleSort([1,2,4,5,6,3,2,5,3])
        
        
        let titleLabel = UILabel()
        titleLabel.userInteractionEnabled = true
        titleLabel.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 100)
        titleLabel.backgroundColor = UIColor.redColor()
        view.addSubview(titleLabel)
        
        let gest = UITapGestureRecognizer(target: self, action: "touch")
        
        titleLabel.addGestureRecognizer(gest)
    }
    
     @objc private func touch(){
        print("已经点击了")
    }
    
    
    /**
    这个就是一个冒泡排序
    
    - parameter array:参数传入一个数组
    
    - returns: 返回一个数组
    */
    
    
    
    
    
    
    private func bubbleSort(var array:[Int])->([Int]){
        
        for var i = 0;i<array.count;i++ {
            for var j = 0;j<array.count-i - 1;j++ {
                if array[j] < array[j+1]{
                    let temp = array[j]
                    array[j] = array[j+1]
                    array[j+1] = temp
                }
            }
        }
        
        print(array)
        
        return array
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

