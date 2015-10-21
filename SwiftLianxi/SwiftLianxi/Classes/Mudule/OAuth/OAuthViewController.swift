//
//  OAuthViewController.swift
//  SwiftLianxi
//
//  Created by 高李军 on 15/10/21.
//  Copyright © 2015年 LJLianXi. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {
    
    let WB_Client_ID        = "479651210"
    let WB_Client_Secret    = "09baa7c3aba7aadd2e8a19e4a43077b1"
    let WB_Redirect_URI     = "http://itheima.com"
    
    
    var webView: UIWebView {
        return view as! UIWebView
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadOAuthPage()
        // Do any additional setup after loading the view.
    }
    
    private func loadOAuthPage(){
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(WB_Client_ID)&redirect_uri=\(WB_Redirect_URI)"
        webView.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
