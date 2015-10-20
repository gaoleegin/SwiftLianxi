//
//  MainViewController.swift
//  SwiftLianxi
//
//  Created by 高李军 on 15/10/19.
//  Copyright © 2015年 LJLianXi. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    @IBOutlet weak var mainTabar: MainTabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        
        addChildViewController("首页", image: "tabbar_home", storyName: "Home")
        addChildViewController("发现", image: "tabbar_discover", storyName: "Discover")
        addChildViewController("消息", image: "tabbar_message_center", storyName: "Message")
        addChildViewController("我的", image: "tabbar_profile", storyName: "Profile")
        // Do any additional setup after loading the view.
        
        //可以直接打印，可以给撰写按钮添加监听事件
        print(self.mainTabar.plusBtn)
        
        mainTabar.plusBtn.addTarget(self, action: "plusBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
    }
    //
     func plusBtnClicked(){
        print("添加按钮的点击")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    
    private func addChildViewController(title:String,image:String,storyName:String) {
        let sb = UIStoryboard(name: storyName, bundle: nil)
        let nav = sb.instantiateInitialViewController() as!UINavigationController
        nav.title = title
        nav.topViewController?.title = title
        nav.tabBarItem.image = UIImage(named: image)
        nav.tabBarItem.selectedImage = UIImage(named: image + "_highlighted")
        addChildViewController(nav)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
