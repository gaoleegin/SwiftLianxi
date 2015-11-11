//
//  EmotionViewController.swift
//  UICollectonView的表情键盘的搭建
//
//  Created by 高李军 on 15/11/10.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class EmotionViewController: UIViewController {

    
    lazy var toolBar:UIToolbar = {
        let toolbar = UIToolbar(frame: CGRectZero)
        
        //在这里添加每一个的item
        
        var itemsList = [UIBarButtonItem]()
        
        var index:Int = 0
        
        for itemstr in ["最近","最近","最近","最近","最近"] {
            
            let item = UIBarButtonItem(title: itemstr, style: UIBarButtonItemStyle.Plain, target: self, action: "")
            itemsList.append(item)
            
            if index++ < 4 {
                let flexItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
                itemsList.append(flexItem)
            }
            
        }
        toolbar.items = itemsList
        
        toolbar.tintColor = UIColor.darkGrayColor()
        return toolbar
    }()
    
    lazy var collectionView:UICollectionView = {
        
        //UICollectionView必须有一个布局
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        return collection
    }()
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    

    
    private func setupUI(){
        self.view.addSubview(toolBar)
        self.view.addSubview(collectionView)
        
        //在这里进行布局
        
        
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        var cons = [NSLayoutConstraint]()
        
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[toolBar]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["toolBar":toolBar])
        
       cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[collectionView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["collectionView":collectionView])
        
       cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[collectionView]-[toolBar(44)]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["toolBar":toolBar,"collectionView":collectionView])
        view.addConstraints(cons)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.redColor()
        
        
    }
}





