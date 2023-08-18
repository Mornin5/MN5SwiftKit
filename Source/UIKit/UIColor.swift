//
//  UIColor.swift
//  MN5SwiftKit
//
//  Created by week on 2023/8/18.
//

import Foundation
import CoreGraphics
#if canImport(UIKit)
import UIKit

extension String {
    fileprivate var hexValue: CGFloat? {
        get {
            guard let value = Int(self, radix: 16) else {return nil}
            return CGFloat(value)
        }
    }
    func toRGBA(r: inout CGFloat, g: inout CGFloat, b: inout CGFloat, a: inout CGFloat) -> Bool {
        var h = self.trim.uppercased()
        if h.hasPrefix("#") {
            h = h.subStringInRange(1..<h.count)!
        } else if h.hasPrefix("0X") {
            h = h.subStringInRange(2..<h.count)!
        }
        let length = h.count
        if length != 3 && length != 4 && length != 6 && length != 8 {
            /// RGB: 3
            /// RGBA: 4
            /// RRGGBB: 6
            /// RRGGBBAA: 8
            return false
        }
        
        if length < 5 {
            /// RGB || RGBA
            guard let rr = h.subStringInRange(0..<1)?.hexValue else {return false} // R
            guard let gg = h.subStringInRange(1..<2)?.hexValue else {return false} // G
            guard let bb = h.subStringInRange(2..<3)?.hexValue else {return false} // B
            r = rr / 255
            g = gg / 255
            b = bb / 255
            
            if let aa = h.subStringInRange(3..<4)?.hexValue { // A
                a = aa / 255
            } else {
                a = 1
            }
        } else {
            /// RRGGBB || RRGGBBAA
            guard let rr = h.subStringInRange(0..<2)?.hexValue else {return false} // RR
            guard let gg = h.subStringInRange(2..<4)?.hexValue else {return false} // GG
            guard let bb = h.subStringInRange(4..<6)?.hexValue else {return false} // BB
            r = rr / 255
            g = gg / 255
            b = bb / 255
            
            if let aa = h.subStringInRange(6..<8)?.hexValue { // AA
                a = aa / 255
            } else {
                a = 1
            }
        }
        return true
    }
}

/// for swift
extension UIColor {
    /// The rgb value such as 0x66ccff.
    public static func rgbColor(_ rgb: UInt32) -> UIColor {
        return rgbColor(rgb: rgb, alpha: 1)
    }
    
    /// The rgb value such as 0x66ccffff.
    public static func rgbaColor(_ rgba: UInt32) -> UIColor {
        return UIColor(red: (CGFloat)((rgba & 0xFF000000) >> 24) / 255.0,
                       green: (CGFloat)((rgba & 0xFF0000) >> 16) / 255.0,
                       blue: (CGFloat)(rgba & 0xFF00 >> 8) / 255.0,
                       alpha: (CGFloat)(rgba & 0xFF) / 255.0)
    }
    
    public static func rgbColor(rgb: UInt32, alpha: CGFloat) -> UIColor {
        return UIColor(red: (CGFloat)((rgb & 0xFF0000) >> 16) / 255.0,
                       green: (CGFloat)((rgb & 0xFF00) >> 8) / 255.0,
                       blue: (CGFloat)(rgb & 0xFF) / 255.0,
                       alpha: alpha)
    }
    
    ///  [hex] supported format:
    ///  "#RGB" "#RGBA" "#RRGGBB" "#RRGGBBAA"
    ///   prefix also support 0x/0X
    public static func hexString(_ hex: String) -> UIColor? {
        var r: CGFloat = -1
        var g: CGFloat = -1
        var b: CGFloat = -1
        var a: CGFloat = -1
        if hex.toRGBA(r: &r, g: &g, b: &b, a: &a) && r != -1 && g != -1 && b != -1 && a != -1 {
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
        return nil
    }
}

/// for oc
extension UIColor {
    @objc public static func color(rgb value: UInt32) -> UIColor {
        return UIColor.rgbColor(value)
    }
    
    @objc public static func color(rgba value: UInt32) -> UIColor {
        return UIColor.rgbaColor(value)
    }
    
    @objc public static func color(hex value: NSString) -> UIColor? {
        return UIColor.hexString(String(value))
    }
}


//extension UIColor {
//    @objc public var hexString: String {
//        get {
//            let color = self.cgColor
//            let count: size_t = color.numberOfComponents
//            let components = color.components!
//            var hex: String = ""
//            if count == 2 {
//                let white: UInt = UInt(components[0] * 255)
//                hex = String(format: "%02x%02x%02x", white, white, white)
//            } else if count == 4 {
//                hex = String(format: "%02x%02x%02x", UInt(components[0] * 255), UInt(components[1] * 255), UInt(components[2] * 255))
//            }
//            if !hex.isEmpty {
//                hex = hex.appendingFormat("%02lx", color.alpha * 255 + 0.5)
//            }
//           return hex
//        }
//    }
//}

#endif
