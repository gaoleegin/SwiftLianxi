//
//  ViewController.swift
//  UICollection的使用
//
//  Created by 高李军 on 15/11/8.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pictureViewConstraits: NSLayoutConstraint!
    
    @IBAction func photoClicked() {
    pictureViewConstraits.constant = 286
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //接收通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "selectImage", name: DMButonClicked, object: nil)
        
        //设置照片容器视图的约束
        pictureViewConstraits.constant = 0;
        
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func selectImage(){
        print("\(__FUNCTION__)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

