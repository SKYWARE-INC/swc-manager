//
//  swc-alert.swift
//  swc-navigator
//
//  Created by JayKim on 2022/08/01.
//

import UIKit

public struct SwcAlert {
    
    // UIAlertController start
    public static func showAlertView(target: UIViewController, title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default) { (action:UIAlertAction) in
            
        }
        alertController.addAction(action)
        target.present(alertController, animated: true, completion: nil)
    }
    
    public static func showAlertView(target: UIViewController, title: String, message: String, ok: String,
                       okAlert: @escaping () -> Void) {
        
        target.dismiss(animated: true, completion: nil)
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: ok, style: .default) { (action:UIAlertAction) in
            
            okAlert()
        }
        alertController.addAction(action)
        target.present(alertController, animated: true, completion: nil)
    }
    
    public static func showAlertView(target: UIViewController, title: String, message: String, ok: String, cancel: String,
                       okAlert: @escaping () -> Void, cancelAlert: @escaping () -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancel, style: .cancel) { (action:UIAlertAction) in
            
            alertController.dismiss(animated: true, completion: nil)
            cancelAlert()
        }
        let doneAction = UIAlertAction(title: ok, style: .default) { (action:UIAlertAction) in
            
            alertController.dismiss(animated: true, completion: nil)
            okAlert()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(doneAction)
        target.present(alertController, animated: true, completion: nil)
    }
    
    public static func showAlertView(target: UIViewController, title: String, message: String, defaultText: String, ok: String, cancel: String,
                              okAlert: @escaping () -> Void, cancelAlert: @escaping () -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField {
            (textField) in textField.text = defaultText
        }
        
        let doneAction = UIAlertAction(title: ok, style: .default) { (action:UIAlertAction) in
            alertController.dismiss(animated: true, completion: nil)
            okAlert()
        }
        
        let cancelAction = UIAlertAction(title: cancel, style: .cancel) { (action:UIAlertAction) in
            
            alertController.dismiss(animated: true, completion: nil)
            cancelAlert()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(doneAction)
        target.present(alertController, animated: true, completion: nil)
    }
}

