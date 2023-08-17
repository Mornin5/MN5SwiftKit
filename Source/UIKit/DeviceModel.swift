//
//  DeviceModel.swift
//  MN5SwiftKit
//
//  Created by Mornin5 on 2023/8/17.
//

import Foundation

public struct Screen {
    let ppi: UInt8
    let diagonal: Double
    let scale: UInt8
    let point: CGSize
    let pixel: CGSize
}


public enum PhoneModel {
    
    // 2022年9月7日，新款iPhone 14、14 plus、14 Pro、14 Pro Max发布
    case iPhone14
    case iPhone14Plus
    case iPhone14Pro
    case iPhone14ProMax
    
    /// 2022年3月9日 iPhone SE (第三代)
    case iPhoneSE3
    
    /// 2021年9月14日，新款iPhone 13 mini、13、13 Pro、13 Pro Max发布
    case iPhone13ProMax
    case iPhone13Pro
    case iPhone13
    case iPhone13Mini
    
    /// 2020年10月13日，iPhone 12、iPhone 12 Pro、iPhone 12 Pro Max、iPhone 12 mini
    case iPhone12ProMax
    case iPhone12Pro
    case iPhone12
    case iPhone12Mini
    
    /// 2020年4月15日 iPhone SE (第二代)
    case iPhoneSE2
    
    /// 2019年9月10日 iPhone 11、iPhone 11 Pro、iPhone 11 Pro Max
    case iPhone11ProMax
    case iPhone11Pro
    case iPhone11
    
    /// 2018年9月12日 iPhone XS、iPhoneXS Max、iPhone XR
    case iPhoneXSMax
    case iPhoneXS
    case iPhoneXR
    
    /// 2017年9月12日 iPhone 8/8p，iPhone X
    case iPhoneX
    case iPhone8Plus
    case iPhone8
    
    /// 2016年9月7日，iPhone 7/7p
    case iPhone7Plus
    case iPhone7
    
    /// 2016年3月22日  iPhone SE
    case iPhoneSE1
    
    /// 2015年9月9日，iPhone 6s/6sp 发布
    case iPhone6sPlus
    case iPhone6s
    
    /// 2014年9月10日，iPhone 6/6p 发布
    case iPhone6Plus
    case iPhone6
    
    /// 2013年9月10日，iPhone 5s 和 iPhone 5c 发布
    case iPhone5S
    case iPhone5C
    
    /// 2012年9月12日， iPhone 5发布
    case iPhone5
    
    /// 2011年10月14日  iPhone 4s
    case iPhone4s
    
    /// 2010年6月7日  iPhone 4
    case iPhone4
    
    case simulator
    case unknown
    
}


extension PhoneModel {
    public static var model: PhoneModel {
        get {
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror(reflecting: systemInfo.machine)
            let identifier = machineMirror.children.reduce("") { identifier, element in
                guard let value = element.value as? Int8, value != 0 else {return identifier}
                return identifier + String(UnicodeScalar(UInt8(value)))
            }
            /// https://www.theiphonewiki.com/wiki/Models
            switch identifier {
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return .iPhone4
            case "iPhone4,1":                               return .iPhone4s
                
            case "iPhone5,1", "iPhone5,2":              return .iPhone5
            case "iPhone5,3", "iPhone5,4":              return .iPhone5C
            case "iPhone6,1", "iPhone6,2":              return .iPhone5S
                
                
            case "iPhone7,2":                           return .iPhone6
            case "iPhone7,1":                           return .iPhone6Plus
            case "iPhone8,1":                           return .iPhone6s
            case "iPhone8,2":                           return .iPhone6Plus
                
            case "iPhone9,1", "iPhone9,3":               return .iPhone7
            case "iPhone9,2", "iPhone9,4":               return .iPhone7Plus
                
            case "iPhone10,1", "iPhone10,4":             return .iPhone8
            case "iPhone10,2", "iPhone10,5":             return .iPhone8Plus
                
            case "iPhone10,3", "iPhone10,6":             return .iPhoneX
            case "iPhone11,8":                          return .iPhoneXR
            case "iPhone11,2":                          return .iPhoneXS
            case "iPhone11,6", "iPhone11,4":            return .iPhoneXSMax
                
                
            case "iPhone12,1":                          return .iPhone11
            case "iPhone12,3":                          return .iPhone11Pro
            case "iPhone12,5":                          return .iPhone11ProMax
                
                
            case "iPhone13,1":                          return .iPhone12Mini
            case "iPhone13,2":                          return .iPhone12
            case "iPhone13,3":                          return .iPhone12Pro
            case "iPhone13,4":                          return .iPhone12ProMax
                
                
            case "iPhone14,4":                          return .iPhone13Mini
            case "iPhone14,5":                          return .iPhone13
            case "iPhone14,2":                          return .iPhone13Pro
            case "iPhone14,3":                          return .iPhone13ProMax
                
                
            case "iPhone14,7":                          return .iPhone14
            case "iPhone14,8":                          return .iPhone14Plus
            case "iPhone15,2":                          return .iPhone14Pro
            case "iPhone15,3":                          return .iPhone14ProMax
                
            case "iPhone8,4":                           return .iPhoneSE1
            case "iPhone12,8":                          return .iPhoneSE2
            case "iPhone14,6":                          return .iPhoneSE3
                
            case "i386", "x86_64", "arm64":            return .simulator
                
            default:
                return .unknown
            }
        }
    }
}




extension PhoneModel {
    public var physicalResolution: CGSize? {
        get {
            switch self {
            case .iPhone4, .iPhone4s:
                return CGSize(width: 640, height: 960)
            case .iPhone5, .iPhone5S, .iPhone5C:
                return CGSize(width: 640, height: 1136)
            case .iPhone6, .iPhone6s, .iPhone7, .iPhone8:
                return CGSize(width: 750, height: 1134)
            case .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus:
                return CGSize(width: 1242, height: 2208)
            case .iPhoneX, .iPhoneXS:
                return CGSize(width: 1125, height: 2436)
            case .iPhoneXR, .iPhone11:
                return CGSize(width: 828, height: 1792)
            default:
                return nil
            }
        }
    }
}
