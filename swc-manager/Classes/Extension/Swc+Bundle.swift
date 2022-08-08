//
//  Bundle.swift
//  swc-utils
//
//  Created by JayKim on 2022/08/01.
//
import Foundation

public extension Bundle {
    var appName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }

    var version: String? {
        guard let dictionary = Bundle.main.infoDictionary,
              let version = dictionary["CFBundleShortVersionString"] as? String else {
            return nil
        }
        let returnAppVerion: String = "\(version)"
        return returnAppVerion

    }

    var buildVersion: String? {
        guard let dictionary = Bundle.main.infoDictionary,
              let build = dictionary["CFBundleVersion"] as? String else {return "\(1.0)"}
        let returnBuildVersion: String = "\(build)"
        return returnBuildVersion
    }

}
