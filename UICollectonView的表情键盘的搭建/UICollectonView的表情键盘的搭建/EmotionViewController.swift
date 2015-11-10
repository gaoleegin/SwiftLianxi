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
        
        let tool = UIToolbar(frame: CGRectZero)
        
        
        var baritems:[UIBarButtonItem] = [UIBarButtonItem]()
        
        var index = 0
        
        for str in ["最近","最近","最近","最近"] {
            let bar = UIBarButtonItem(title: str, style: UIBarButtonItemStyle.Plain, target: self, action: "selectItem:")
            bar.tag = index
            baritems.append(bar)
            
            //添加弹簧
            if index++ < 3 {
                let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
                baritems.append(item)
            }
        }
        
        tool.tintColor = UIColor.darkGrayColor()
        tool.items = baritems
        
        return tool
    }()
    
        lazy var emotionView:UICollectionView = {
            
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSizeMake(30, 30)
            layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
//            layout.minimumInteritemSpacing = 0
//            layout.minimumLineSpacing = 0
            layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
            
            
            let emotionCollection:UICollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
            
            emotionCollection.delegate = self
            emotionCollection.dataSource = self
            emotionCollection.pagingEnabled = true
            emotionCollection.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
            
            return emotionCollection
        }()
    
    
    func selectItem(selectItemIndex:UIBarButtonItem){
        print(selectItemIndex.tag)
    }
    
    /*
        UI的组成，
    */
    //自定义键盘的fram是需要考虑的
    override func loadView() {
        super.loadView()
        
        //设置UI
        setupUI()
        
        
    }
    
    private func setupUI(){
        
        
        //添加toolBar
        view.addSubview(toolBar)
        //添加表情键盘
        view.addSubview(emotionView)
        
        var cons = [NSLayoutConstraint]()
        
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        emotionView.translatesAutoresizingMaskIntoConstraints = false
        
       cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[emotionView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["emotionView":emotionView])
        
      cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[toolBar]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["toolBar":toolBar])
        
     cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[emotionView]-[toolBar(44)]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["emotionView":emotionView,"toolBar":toolBar])
        
        view.addConstraints(cons)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.redColor()
        
        //setTranslatesAutoresizingMaskIntoConstraints
     
    }
}

extension EmotionViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21 * 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
}



