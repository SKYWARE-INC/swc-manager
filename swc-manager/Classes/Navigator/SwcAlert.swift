//
//  swc-alert.swift
//  swc-navigator
//
//  Created by JayKim on 2022/08/01.
//

import UIKit

public protocol SwcAlert:UIViewController {
    func showAlert(target: UIViewController, title: String, message: String)
    func showAlert(target: UIViewController, title: String, message: String, ok: String,
                       okAlert: @escaping () -> Void)
    func showAlert(target: UIViewController, title: String, message: String, ok: String, cancel: String,
                       okAlert: @escaping () -> Void, cancelAlert: @escaping () -> Void)
    func showAlert(target: UIViewController, title: String, message: String, defaultText: String, ok: String, cancel: String,
                              okAlert: @escaping () -> Void, cancelAlert: @escaping () -> Void)
}
