//
//  Utils.swift
//  swc-utils
//
//  Created by JayKim on 2022/08/01.
//

public struct Utils {   //여기에 util 관련 계속 추가..
    
    public static func strToBool(yn: String) -> Bool {
        if yn.lowercased() == "y" {
            return true
        }
        return false
    }
    
    public static func boolToStr(bool: Bool) -> String {
        if bool == true {
            return "Y"
        }
        return "N"
    }
    
    public static func getFormatDate(format: String) -> String? {
        let date = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        let currentDate = dateFormat.string(from: date)
        return currentDate
    }
}
