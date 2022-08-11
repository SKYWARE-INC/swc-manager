//
//  WebViewProgress.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/11.
//

import UIKit


public class WebViewProgress: UIProgressView {
    var height:CGFloat = 10.0
    // Do not change this default value,
    // this will create a bug where your progressview wont work for the first x amount of pixel.
    // x being the value you put here.
    
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size:CGSize = CGSize.init(width: self.frame.size.width, height: height)
        return size
    }
    
}
