//
//  PictureViewController.swift
//  UICollection实现照片选择器
//
//  Created by 高李军 on 15/11/9.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class PictureViewController: UICollectionViewController {
    
    static var imageArrsay:[UIImage] = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return PictureViewController.imageArrsay.count ?? 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pictureCell", forIndexPath: indexPath) as! PictureViewCell
    
        cell.image = PictureViewController.imageArrsay[indexPath.item]
       
    
        return cell
    }

}

class  PictureViewCell:UICollectionViewCell {
    
    
    //切记
    @IBOutlet weak var pictureImage: UIButton?
    
    var image:UIImage?{
        didSet{
            pictureImage?.setBackgroundImage(image, forState: UIControlState.Normal)
        }
    }
    
}

