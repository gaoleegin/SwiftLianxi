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
        
        var numbersArray:[Int] = [1,2,43,3,4,5]
        
        for var i = 0;i<numbersArray.count;i++ {
            for var j=0;j<numbersArray.count-i-1;++j{
                if (numbersArray[j] < numbersArray[j+1] ) {
                    let temp:Int = numbersArray[j]
                    numbersArray[j]  =  numbersArray[j+1]
                    numbersArray[j+1]  = temp
                }
            }
        }
        
        
        print("==========\(numbersArray)")
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

