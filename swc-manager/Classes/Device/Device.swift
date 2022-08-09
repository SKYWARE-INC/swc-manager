//
//  Device.swift
//  swc-utils
//
//  Created by JayKim on 2022/08/01.
//

import Foundation

public struct Device {
    //탈옥 체크
    public static func isRooted(_set chk: Bool) -> Bool {
        guard let cydiaUrlScheme = NSURL(string: "cydia://package/com.example.package") else { return false }
        if UIApplication.shared.canOpenURL(cydiaUrlScheme as URL) {
            return chk //true
        }
        #if targetEnvironment(simulator)
        print("It's an iOS Simulator")
        return chk //true
        #else
        
        #if arch(i386) || arch(x86_64)
        return !chk //false
        #endif
        
        
        
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: "/Applications/Cydia.app") ||
            fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
            fileManager.fileExists(atPath: "/bin/bash") ||
            fileManager.fileExists(atPath: "/usr/sbin/sshd") ||
            fileManager.fileExists(atPath: "/etc/apt") ||
            fileManager.fileExists(atPath: "/usr/bin/ssh") ||
            fileManager.fileExists(atPath: "/private/var/lib/cydia") ||
            fileManager.fileExists(atPath: "/Applications/blackra1n.app") ||
            fileManager.fileExists(atPath: "/Applications/FakeCarrier.app") ||
            fileManager.fileExists(atPath: "/Applications/Icy.app") ||
            fileManager.fileExists(atPath: "/Applications/IntelliScreen.app") ||
            fileManager.fileExists(atPath: "/Applications/MxTube.app") ||
            fileManager.fileExists(atPath: "/Applications/RockApp.app") ||
            fileManager.fileExists(atPath: "/Applications/SBSettings.app") ||
            fileManager.fileExists(atPath: "/Applications/WinterBoard.app") ||
            fileManager.fileExists(atPath: "/private/var/lib/apt") {
            return chk //true
        }
        if canOpen(path: "/Applications/Cydia.app") ||
            canOpen(path: "/bin/ps") ||
            canOpen(path: "/etc/fstab") ||
            canOpen(path: "/etc/master.passwd") ||
            canOpen(path: "/private/var/stash") ||
            canOpen(path: "/private/var/mobile/Library/SBSettings/Themes") ||
            canOpen(path: "/private/var/mobile/Library/SBSettings/Themes") ||
            canOpen(path: "/private/var/tmp/cydia.log") ||
            canOpen(path: "/private/var/lib/cydia") ||
            canOpen(path: "/bin/bash") ||
            canOpen(path: "/usr/sbin/sshd") ||
            canOpen(path: "/usr/libexec/sftp-server") ||
            canOpen(path: "/etc/apt") ||
            canOpen(path: "/usr/bin/ssh") {
            return chk //true
        }
        let path = "/private/" + NSUUID().uuidString
        do {
            try "anyString".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            try fileManager.removeItem(atPath: path)
            return chk //true
        } catch {
            return !chk //false
        }
        #endif
    }
    
    static func canOpen(path: String) -> Bool {
        let file = fopen(path, "r")
        guard file != nil else { return false }
        fclose(file)
        return true
    }
}
