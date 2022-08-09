//
//  Swc+UIApplicationDelegate.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/08.
//

import Foundation

extension UIApplicationDelegate {
    
    public func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        var mask = Orientation(rotate: .portrait)
        let shared = UIApplication.shared
        if let rootVC = shared.topVCWithRootVC(rootViewController: window?.rootViewController){
            if rootVC.responds(to: Selector(("canRotate"))) {
                mask.setRotate(.allButUpsideDown, .after)
            }
        }
        return mask.rotate
    }
    
}
