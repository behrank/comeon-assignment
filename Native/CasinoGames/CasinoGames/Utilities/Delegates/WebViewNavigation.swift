//
//  WebViewNavigation.swift
//  CasinoGames
//
//  Created by Behran Kankul on 21.06.2022.
//

import Foundation
import WebKit

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    
    var onWebContentLoadedAction: (()->Void)?
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        debugPrint("finished Nav")
        
        webView.evaluateJavaScript("document.getElementsByClassName('ant-btn ant-btn-primary')[0].click()") { [weak self] result, error in
            self?.onWebContentLoadedAction?()
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        debugPrint(error)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
}
