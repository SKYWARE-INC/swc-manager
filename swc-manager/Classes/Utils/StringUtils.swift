//
//  StringUtils.swift
//  swc-manager
//
//  Created by jjeong on 2022/08/11.
//

import Foundation

public struct StringUtils { // String 타입 유틸
    
    public static func strToBool(yn: String) -> Bool {
        if yn.lowercased() == "y" {
            return true
        }
        return false
    }
    
}
