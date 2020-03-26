//
//  OrdersVC.swift
//  MatajerTrader
//
//  Created by Heba lubbad on 3/25/20.
//  Copyright © 2020 Heba lubbad. All rights reserved.
//

import UIKit
import WebKit

class OrdersVC: UIViewController {
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
        webView.scrollView.bounces = true
        
        self.webView.load(NSURLRequest(url: URL(string: "https://mapp.sa/admin/order")!) as URLRequest);
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil);
        
    }
    
    @objc
    func refreshWebView(_ sender: UIRefreshControl) {
        webView?.reload()
        sender.endRefreshing()
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            self.progressView.progress = Float(self.webView.estimatedProgress);
            if self.webView.estimatedProgress != 1 {
                progressView.isHidden = false
            }else{
                progressView.isHidden = true
            }
            
            
        }
    }
    
    
    
}
