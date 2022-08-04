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
}

@available(iOS 11.0, *)
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
                        //SkyLog.d(message: "메인 🍪저장 카운트다운 \(cookies_left)개")
                        if cookies_left == 0 {
                            webView.load(path)
                        }
                    })
                }
            }
        }
        else {
            //SkyLog.d(message: "🍪 없음. 메인으로 🚗")
            webView.load(path)
        }
    }
    
}
