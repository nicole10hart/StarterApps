//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Hart, Nicole on 4/4/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
        
        //let topConstraint = webView.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("WebViewController loaded its view.")
        let bnrURL = URL(string: "https://www.bignerdranch.com")
        let bnrRequest = URLRequest(url: bnrURL!)
        webView.load(bnrRequest)

    }
}
