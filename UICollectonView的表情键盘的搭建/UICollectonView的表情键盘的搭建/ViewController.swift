//
//  ViewController.swift
//  UICollectonView的表情键盘的搭建
//
//  Created by 高李军 on 15/11/10.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //输入文字的view
    @IBOutlet weak var textView: UITextView!
    
    
    //延迟加载，也叫懒加载
    
    lazy var keyboardVC:EmotionViewController = {
        return EmotionViewController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //手动添加子控制器
    private func setupUI(){
        
        addChildViewController(keyboardVC)
        textView.inputView = keyboardVC.view
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

