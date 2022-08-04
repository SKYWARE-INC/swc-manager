//
//  SwcScriptMsgHandler.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/02.
//

import WebKit

open class SwcScriptMsgHandlerVC: UIViewController {

    open override func `self`() -> Self {
        return self
    }
}

extension SwcScriptMsgHandlerVC: WKScriptMessageHandler {
    
    open func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
}
