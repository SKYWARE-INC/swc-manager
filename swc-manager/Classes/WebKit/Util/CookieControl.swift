//
//  CookieUtil.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/04.
//

import Foundation
import WebKit

public protocol CookieProtocol {
    func retrieveCookies(cookies linked: [String: Any], view webView: WKWebView, loadPath path: String)
    func setCookies() -> [String : AnyObject]
}

@available(iOS 13.0, *)
public struct Cookies: CookieProtocol {
    public init() {}
    public func retrieveCookies(cookies linked: [String: Any], view webView: WKWebView, loadPath path: String) {
        
        let ds = WKWebsiteDataStore.default()
        let cookies = ds.httpCookieStore
        
        var cookies_left = 0
        if !linked.isEmpty {
            for (_, cookieProperties) in linked {
                if let _ = HTTPCookie(properties: cookieProperties as! [HTTPCookiePropertyKey : Any] ) {
                    cookies_left += 1
                }
            }
            for (_, cookieProperties) in linked {
                if let cookie = HTTPCookie(properties: cookieProperties as! [HTTPCookiePropertyKey : Any] ) {
                    cookies.setCookie(cookie, completionHandler: {
                        cookies_left -= 1
                        //SkyLog.d(message: "๋ฉ์ธ ๐ช์ ์ฅ ์นด์ดํธ๋ค์ด \(cookies_left)๊ฐ")
                        if cookies_left == 0 {
                            webView.load(path)
                        }
                    })
                }
            }
        }
        else {
            //SkyLog.d(message: "๐ช ์์. ๋ฉ์ธ์ผ๋ก ๐")
            webView.load(path)
        }
    }
    
    public func setCookies() -> [String : AnyObject] {
        //Local Cache Data set -> WKWebDataStore http cookie set
        var cookieRepo: [String : AnyObject] = [:]
        let wds = WKWebsiteDataStore.default()
        let cookies = wds.httpCookieStore
        cookies.getAllCookies { (cookies: [HTTPCookie]) in
            var cookieDict = [String : AnyObject]()
            for cookie in cookies {
                cookieDict[cookie.name] = cookie.properties as AnyObject?
            }
            cookieRepo = cookieDict
        }
        return cookieRepo
    }
}
