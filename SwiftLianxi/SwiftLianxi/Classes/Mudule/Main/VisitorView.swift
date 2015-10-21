//
//  VisitorView.swift
//  SwiftLianxi
//
//  Created by 高李军 on 15/10/21.
//  Copyright © 2015年 LJLianXi. All rights reserved.
//

import UIKit

//协议方法
/**
    定义协议，遵守协议方法 NSObjectProtocol
    在swift中，出了类可以遵循协议，结构体也可以遵循协议

*/

@objc protocol VisitorViewDelegate:NSObjectProtocol{
    
    //点击登录按钮
   optional func  VisitorViewLoginViewDidSelected()
    
    //点击注册按钮
   optional func VisitorViewRegiestViewDidSelected()

}

class VisitorView: UIView {

    @IBOutlet weak var middleImageView: UIImageView!
    @IBOutlet weak var zhuanlunImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak  var delegate:VisitorViewDelegate?
    
    @IBAction func loginBtnClcke(sender: AnyObject) {
        delegate?.VisitorViewLoginViewDidSelected!()
    }
    @IBAction func registView(sender: AnyObject) {
        delegate?.VisitorViewRegiestViewDidSelected!()
    }
    
}
