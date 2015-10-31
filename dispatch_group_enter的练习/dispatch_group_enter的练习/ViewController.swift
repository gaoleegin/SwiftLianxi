//
//  ViewController.swift
//  dispatch_group_enter的练习
//
//  Created by 高李军 on 15/10/31.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //建立一个 dispatch_group,可以减痛一组异步任务完成以后，统一得到通知
        let group = dispatch_group_create()
        
        //进入群组
        dispatch_group_enter(group)
        
        
        //离开群组
        dispatch_group_leave(group)
        
        
        //监听群组调度
        dispatch_group_notify(group, dispatch_get_main_queue()) { () -> Void in
            //执行回调
        }
        
        /*
        // 3. 监听群组调度
        dispatch_group_notify(group, dispatch_get_main_queue(), { () -> Void in
        println("图片缓存完成+加载数据 \(NSHomeDirectory())")
        // 执行回调
        completion(statuses: statuses)
        
        
        */
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

/*
// 建立一个 dispatch_group，可以监听一组异步任务完成后，统一得到通知
let group = dispatch_group_create()

// 遍历微博数据数组
for s in statuses as [Status]! {
// 没有图片继续循环
if s.pictureURLs == nil {
continue
}

// 遍历图片 url 数组，下载图像
for url in s.pictureURLs! {
// downloadImageWithURL 本身会下载图片，并且完成缓存
// 回调参数，通常是有 UI 交互才会使用的

// 1> 进入群组
dispatch_group_enter(group)
// SDWebImage 下载图像前，会检查本地是否存在图片缓存，如果存在，会直接返回，不会去网络上加载
// 速度快，效率高！
// 如果要判断服务器的图片是否更改，可以使用 RefreshCached 选项
SDWebImageManager.sharedManager().downloadImageWithURL(url, options: nil, progress: nil, completed: { (_, _, _, _, _) in

// 2> 离开群组，一定要放在 block 的最后一句，表示异步真正执行完成
dispatch_group_leave(group)
})
}
}

// 3. 监听群组调度
dispatch_group_notify(group, dispatch_get_main_queue(), { () -> Void in
println("图片缓存完成+加载数据 \(NSHomeDirectory())")
// 执行回调
completion(statuses: statuses)
})
*/

