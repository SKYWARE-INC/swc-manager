//
//  SkyShared.swift
//  FBSnapshotTestCase
//
//  Created by JayKim on 2022/08/03.
//

import Foundation

public class SkyShared: NSObject {
    
    private override init() {
        super.init()
    }
    
    // UserDefault 셋팅
    public static func setUserDefault(key: String, value: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        
        defaults.synchronize()
    }
    
    // UserDefault 셋팅
    public static func setUserDefault(key: String, value: Any?) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        
        defaults.synchronize()
    }
    
    // Orverride UserDefault set
    public static func setUserDefault(key: String, value: Dictionary <String, Any>) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    // return type Any
    public static func getUserDefault(key: String) -> Any {
        let defaults = UserDefaults.standard
        let data: Any = defaults.object(forKey: key) as Any
        return data
    }
    
    // return type String
    public static func getUserString(key: String) -> String {
        let defaults = UserDefaults.standard
        let data: String = (defaults.string(forKey: key) ?? "") as String
        return data
    }
    
    // return type Boolean
    public static func getUserBool(key: String) -> Bool {
        let data = UserDefaults.standard.bool(forKey: key)
        return data
    }
    
    //return type Dictonary
    public static func getUserDictionary(key: String) -> [String : Any]? {
        let defaults = UserDefaults.standard
        let data: [String : Any] = defaults.dictionary(forKey: key) ?? [:]
        return data
    }
    
    //remove Object
    public static func removeObject(key: String) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        
        defaults.synchronize()
    }

}
