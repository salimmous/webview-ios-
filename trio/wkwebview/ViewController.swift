//
//  ViewController.swift
//  wkwebview
//
//  Created by Afrar Malakooth on 6/5/20.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate{
    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.configuration.preferences.javaScriptEnabled = true
        webView.configuration.preferences.javaScriptCanOpenWindowsAutomatically = true

        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://pizza-trio.de/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
      if navigationAction.request.url?.scheme == "tel" || navigationAction.request.url?.scheme == "mailto" {
          UIApplication.shared.openURL(navigationAction.request.url!)
          decisionHandler(.cancel)
      } else {
          decisionHandler(.allow)
      }
  }
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message:
    String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () ->
    Void) {
    let alertController = UIAlertController(title: message,message: nil,preferredStyle:
    .alert)

    alertController.addAction(UIAlertAction(title: "OK", style: .cancel) {_ in
    completionHandler()})

    self.present(alertController, animated: true, completion: nil)
    }
   
    
    
}

