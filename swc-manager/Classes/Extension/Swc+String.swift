//
//  Swc+String.swift
//  swc-manager
//
//  Created by jjeong on 2022/08/22.
//

import Foundation
import CryptoKit

public protocol hashProtocol {
    @available(iOS 13.0, *) static func MD5(value: String) -> String
}

extension String : hashProtocol{
    
    @available(iOS 13.0, *)
    public static func MD5(value: String) -> String {
        let digest = Insecure.MD5.hash(data: value.data(using: .utf8) ?? Data())
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
