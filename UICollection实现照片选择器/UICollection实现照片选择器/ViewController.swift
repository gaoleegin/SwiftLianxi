//
//  ViewController.swift
//  UICollection实现照片选择器
//
//  Created by 高李军 on 15/11/9.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func selectPicture(sender: UIBarButtonItem) {
        
        print("\(__FUNCTION__)")
        
        //打开照相机或者是相册
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            print("无法访问照片库")
        }
        
         let picker = UIImagePickerController()
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        dismissViewControllerAnimated(true) { () -> Void in
            PictureViewController.imageArrsay.append(image)
        }
    }
}


