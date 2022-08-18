//
//  BoolUtils.swift
//  swc-manager
//
//  Created by jjeong on 2022/08/11.
//

import Foundation

public struct BoolUtils {   // Boolean 타입 유틸
    
    public static func boolToStr(bool: Bool) -> String {
        if bool == true {
            return "Y"
        }
        return "N"
    }
    
}
