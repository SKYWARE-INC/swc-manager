//
//  ColorUtils.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/09.
//

import Foundation

public struct ColorUtil {
    public static func rgbColor(rgb value: UInt, alpah aph: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: aph
        )
    }
}
