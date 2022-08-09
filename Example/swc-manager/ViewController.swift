//
//  ViewController.swift
//  swc-manager
//
//  Created by skyware0704@gmail.com on 08/01/2022.
//  Copyright (c) 2022 skyware0704@gmail.com. All rights reserved.
//

import UIKit
import swc_manager
import WebKit

class ViewController: SwcRootVC, WebViewEvent {

    class NotiMsg: SwcNotiScriptMsgHandler {
        override func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            
        }
    }
    
    @IBOutlet weak var webView: WKWebView!
    
    func webViewPullToRefreshHandler(source: UIRefreshControl) {
        
    }
    
    func webViewPullToCustomHandler(source: UIRefreshControl) {
        
    }
    
    struct script: SwcScriptProtocol {
        var methods: [String]
        
        func getMethod(methodName _: MethodType) -> String {
            return ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //1. 앱 이름 가져오기
        if let appNm = Bundle.main.appName {
            print("app name : \(appNm)")
        }
        
        //2. 버전 가져오기
        if let version = Bundle.main.version {
            print("app version : \(version)")
        }
        
        //3. 빌드 버전 가져오기
        if let versionCode = Bundle.main.buildVersion {
            print("app buildVersion : \(versionCode)")
        }
        
        if Device.isRooted(_set: true) {
//            _set flag true면 루팅 체크 O
//            _set flag false면 루팅 체크 X
        }
        
        SkyShared.setUserDefault(key: "key", value: false)
        print("share key \(SkyShared.getUserBool(key: "key"))")
        //test
        let t = script.init(methods: ["detail", "loing"])
        for name in t.methods {
            print("func name \(name)")
            //webView.configuration.userContentController.add(super.`self`(), name: name as! String)
        }
        
        
        //1. 원래꺼 호출
        // let origin: CookieProtocol
        // origin.retrieveCookies(cookies: <#T##[String : Any]#>, view: <#T##WKWebView#>, loadPath: <#T##String#>)
        //2. 커스텀 된 프로토콜
        // let c: customProtocol
        // c.retrieveCookies(cookies: <#T##[String : Any]#>, view: <#T##WKWebView#>, loadPath: <#T##String#>)
    }
    
    @objc func test() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //입 맛에 바꿀꺼면 쿠키 프로토콜 상속받아 사용해요.
    struct customProtocol: CookieProtocol {
        func retrieveCookies(cookies linked: [String : Any], view webView: WKWebView, loadPath path: String) {
            
        }
        
        
    }
    
    //custom func
    @objc func customBack() {
        // 1. 원하는 백 스택 카운트(인덱스)
        //Navigator.popBack(1, from: self)
        // 2. 특정 뷰 컨트롤러 지정
        // Navigator.popBack(to: [특정뷰].self, from: self)
    }

}
