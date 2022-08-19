//
//  SwcIndicator.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/09.
//

import Foundation
import UIKit

public struct SwcIndicator {
    
//    var loadingView = UIView()
//    var container = UIView()
//    var activityIndicator = UIActivityIndicatorView()
//    var mainView:UIView!
//
//    public init(view: UIView) {
//        mainView = view
//    }
//
//    public init(view: UIView, lvBgColor: UIColor = ColorUtil.rgbColor(rgb: 0xffffff, alpah: 0.0),
//         ctBgColor: UIColor = ColorUtil.rgbColor(rgb: 0xffffff, alpah: 0.6),
//         radius: CGFloat = 10.0, border: CGFloat = 0.5) {
//        mainView = view
//
//        loadingView = UIView(frame: mainView.frame)
//        loadingView.tag = 1
//        loadingView.backgroundColor = lvBgColor
//
//        mainView.addSubview(loadingView)
//
//        container = UIView()
//        container = UIView(frame: CGRect(x: 0, y: 0, width: mainView.frame.width/3, height: mainView.frame.width/3))
//        container.backgroundColor = ctBgColor
//        container.layer.cornerRadius = radius
//        container.layer.borderColor = UIColor.gray.cgColor
//        container.layer.borderWidth = border
//        container.clipsToBounds = true
//        container.center = loadingView.center
//
//        activityIndicator = UIActivityIndicatorView()
//
//
//        activityIndicator.frame = CGRect(x: 0, y: 0, width: mainView.frame.width/5, height: mainView.frame.width/5)
//        activityIndicator.style = .whiteLarge
//        activityIndicator.center = loadingView.center
//
//        loadingView.addSubview(container)
//        loadingView.addSubview(activityIndicator)
//    }
//
//    public func showLoading() {
//        activityIndicator.startAnimating()
//    }
//
//    public func hideLoading() {
//        UIView.animate(withDuration: 0.0, delay: 1.0, options: .curveEaseOut, animations: {
//            container.alpha = 0.0
//            loadingView.alpha = 0.0
//            activityIndicator.stopAnimating()
//        }, completion: { finished in
//            activityIndicator.removeFromSuperview()
//            container.removeFromSuperview()
//            loadingView.removeFromSuperview()
//        })
//    }
}
