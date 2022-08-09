//
//  Swc+UIApplication.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/08.
//

import Foundation

public enum OrientationStatus {
    case after
    case before
}

public struct Orientation: OrientationProtocol {
    
    public var rotate: UIInterfaceOrientationMask = UIApplication.shared.orientationMask(.portrait, .after)
    
    public mutating func setRotate(_ mask: UIInterfaceOrientationMask,_ status: OrientationStatus) {
        switch(mask) {
        case .landscapeLeft:
            rotate = UIApplication.shared.orientationMask(.landscapeLeft, status)
            break;
        case .landscapeRight:
            rotate = UIApplication.shared.orientationMask(.landscapeRight, status)
            break;
        default:
            rotate = UIApplication.shared.orientationMask(.portrait, status)
        }
    }
}

public protocol OrientationProtocol {
    var rotate: UIInterfaceOrientationMask {get set}
    mutating func setRotate(_ mask: UIInterfaceOrientationMask,_ status: OrientationStatus)
}

extension UIApplication {
    
    public func orientationMask(_ mask: UIInterfaceOrientation,_ status: OrientationStatus) -> UIInterfaceOrientationMask {
        switch(mask) {
        case .landscapeLeft:
            return status == OrientationStatus.after ? [.landscape, .landscapeLeft] : [.landscapeLeft, .landscape]
        case .landscapeRight:
            return status == OrientationStatus.after ? [.landscape, .landscapeRight] : [.landscapeRight, .landscape]
        default:
            return status == OrientationStatus.after ? [.portrait, .portraitUpsideDown] : [.portraitUpsideDown, .portrait]
        }
    }
    
    public func topVC(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return topVC(base: nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            
            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return topVC(base: top)
            } else if let selected = tab.selectedViewController {
                return topVC(base: selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return topVC(base: presented)
        }
        
        return base
    }

    public func topVCWithRootVC(rootViewController rootVC: UIViewController!) -> UIViewController? {
        
        if (rootVC == nil) { return nil }
        if (rootVC.isKind(of: (UITabBarController).self)) {
            return topVCWithRootVC(rootViewController: (rootVC as! UITabBarController).selectedViewController)
        } else if (rootVC.isKind(of:(UINavigationController).self)) {
            return topVCWithRootVC(rootViewController: (rootVC as! UINavigationController).visibleViewController)
        } else if (rootVC.presentedViewController != nil) {
            return topVCWithRootVC(rootViewController: rootVC.presentedViewController)
        }
        return rootVC
    }
}

