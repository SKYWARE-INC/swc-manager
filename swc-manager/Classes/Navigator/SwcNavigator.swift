//
//  swc-navigator.swift
//  FBSnapshotTestCase
//
//  Created by jjeong on 2022/08/08.
//
import UIKit



public protocol NavigatorProtocol {
    static func popBack(_ nb: Int, from vc: UIViewController)
    static func popBack<T: UIViewController>(to: T.Type, from vc: UIViewController)
}

public struct Navigator: NavigatorProtocol {

    // pop back to index
    public static func popBack(_ nb: Int, from vc: UIViewController) {
        let viewControllers: [UIViewController] = vc.navigationController!.viewControllers
        guard viewControllers.count < nb else {
            vc.navigationController!.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
            return
        }
    }

    // pop back to specific viewcontroller
    public static func popBack<T: UIViewController>(to: T.Type, from vc: UIViewController) {
        var viewControllers: [UIViewController] = vc.navigationController!.viewControllers
        viewControllers = viewControllers.reversed()
        for currentViewController in viewControllers {
            if currentViewController .isKind(of: to) {
                vc.navigationController!.popToViewController(currentViewController, animated: true)
                break
            }
        }
    }
}

