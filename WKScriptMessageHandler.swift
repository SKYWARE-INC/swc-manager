//
//  WKScriptMessageHandler.swift
//  swc-manager
//
//  Created by jjeong on 2022/08/02.
//

import Foundation

//inner class example
class ParentVC : UIViewController, WKUIdelegate { //parent class

    class TestNotiScriptMessageHandler: WKScriptMessageHandler { //inner class
        unowned let parent : ParentVC
        init(parent: ParentVC){
            self.parent = parent
        }
        //Override Function in WKScriptMessageHandler
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            // 호출 파라미터에 대한 내용
            // 1. message.name : 웹에서 호출하는 함수명
            // 2. message.body : 웹에서 넘겨주는 파라미터 (object)
            switch message.name {
                case "test1": //test1 이라는 함수 호출 시
                    let val = message.body as! String //String 타입의 파라미터 1개를 받음
                    parent.setTest(text: val)  //parent에 정의되어져 있는 setTest(text)함수 호출
                    break;
                case "test2": //test2 이라는 함수 호출 시
                    let number: Int
                    let dict: Dictionary<String, Any>
                    if type(of: message.body) is NSInteger.Type { //integer type 일 때
              number = message.body as! Int
          } else if type(of: message.body) is NSDictionary.Type { //dictionary type 일 때
              dict = message.body as! Dictionary<String, Any>
          }
                    break;
            }
        }
  }

    @objc func setTest(text val: String) {
        print("TEST \(val).")
    }
}
