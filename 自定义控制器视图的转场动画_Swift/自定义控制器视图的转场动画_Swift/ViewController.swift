//
//  ViewController.swift
//  自定义控制器视图的转场动画_Swift
//
//  Created by 高李军 on 15/11/25.
//  Copyright © 2015年 高李军. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblMessage:UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeGestureRecongnizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "showSecondViewController");
        self.view.addGestureRecognizer(swipeGestureRecongnizer);
        
    }
    
    func showSecondViewController(){
        self.performSegueWithIdentifier("idFirstsegue", sender: self);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

