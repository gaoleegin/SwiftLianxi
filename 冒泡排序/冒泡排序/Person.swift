//
//  Person.swift
//  冒泡排序
//
//  Created by 高李军 on 15/11/4.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name:String?{
        didSet {
            self.sex = "女"
        }
    }
    
    var sex:String?
    
    init(name:String) {
        self.name = name;
        //self.sex = sex;
    }
    

}
