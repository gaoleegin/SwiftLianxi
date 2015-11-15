//
//  ViewController.swift
//  100-Swift通知的
//  Created by 高李军 on 15/11/13.
//  Copyright © 2015年 高李军. All rights reserved.
//  

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("hahahahah")
        
        returnData { (title) in
            
            print(title)
        }
        
        print("hahahahah")
        
        
    }

    
    
    func returnData(complication:(title:String)->())->String{
        
        complication(title: "fanhui")
        
        return "很好啊"
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

