//
//  SwcScriptProtocol.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/04.
//

import Foundation

public enum MethodType: String {
    case detailVC
    case zoomVC
    case login
    case join
    case setCookie
    case getCookie
    case setString
    case setBoolean
    case setObject
    case setDictionary
}

public protocol SwcScriptProtocol {
    var methods: [String] {set get}
    func getMethod(methodName _: MethodType) -> String
}
