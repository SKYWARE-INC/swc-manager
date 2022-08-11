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
    
    // 이메일 정규성 체크
    public static func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    // 비밀번호 정규성 체크
    public static func isValidPassword(password:String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}" // 8자리 ~ 50자리 영어+숫자+특수문자
        // let passwordRegEx =  ("(?=.*[A-Za-z])(?=.*[0-9]).{8,20}") //숫자+문자 포함해서 8~20글자 사이의 text 체크하는 정규표현식
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
    // 핸드폰번호 정규성 체크
    public static func isValidPhoneNumber(phone:String) -> Bool {
        let phoneNumberRegEx = "^01[0-1, 7][0-9]{7,8}$"
        let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegEx)
        return phoneNumberTest.evaluate(with: phone)
    }
    
    // 닉네임 체크
    public static func isNickNamePattern(name:String) -> Bool {
        let nickNameRegEx = "^[a-zA-Z0-9가-힣._-]{3,15}$/g"
        let nickNameTest = NSPredicate(format: "SELF MATCHES %@", nickNameRegEx)
        return nickNameTest.evaluate(with: name)
    }
}
