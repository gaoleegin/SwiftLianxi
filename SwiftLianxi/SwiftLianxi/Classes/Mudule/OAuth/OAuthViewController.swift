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
    
    
    @IBOutlet weak var webView: UIWebView!
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadOAuthPage()
        webView.delegate = self;
        // Do any additional setup after loading the view.
    }
    
    private func loadOAuthPage(){
        
        SVProgressHUD.show()
        
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(WB_Client_ID)&redirect_uri=\(WB_Redirect_URI)"
        webView.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension OAuthViewController : UIWebViewDelegate{
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        //第一次进入的时间的urlString
        //https://api.weibo.com/oauth2/authorize?client_id=479651210&redirect_uri=http://itheima.com
        
        //输入用户名和密码以后，点击确定以后,点击OAuth授权以后的urlString
        //https://api.weibo.com/oauth2/authorize
        
        //https://api.weibo.com/oauth2/authorize#
        
        //https://api.weibo.com/oauth2/authorize
        
        //点击允许以后所做的事情
        //http://itheima.com/?code=3c73b66a3a7dc122a52ebcae32525e29
        
        //https://api.weibo.com/oauth2/authorize#
        
        //https://api.weibo.com/oauth2/authorize
        
        let urlString = request.URL!.absoluteString
        
        //let query = request.URL!.query
        
        //如果是官方的页面继续加载
        if urlString.hasPrefix("https://api.weibo.com") {
            return true
        }
        
        if !urlString.hasPrefix(WB_Redirect_URI){
            return false
        }
        
        //如果执行到这里，一定是
        
        let codeStr = "code="
        let query = request.URL!.query!
        
        if query.hasPrefix(codeStr) {
            
            let code = (query as NSString).substringFromIndex(codeStr.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
            
            print("验证码＝" + code)
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        return true

    }
    
}
