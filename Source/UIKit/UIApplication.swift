//
//  UIApplication.swift
//  MN5SwiftKit
//
//  Created by week on 2023/8/18.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension UIApplication {
    @objc public var appBundleName: String {
        Bundle.main.infoDictionary?.stringValue(key: "CFBundleName") ?? ""
    }
    
    @objc public var appBundleID: String {
        Bundle.main.infoDictionary?.stringValue(key: "CFBundleIdentifier") ?? ""
    }
    
    @objc public var appVersion: String {
        Bundle.main.infoDictionary?.stringValue(key: "CFBundleShortVersionString") ?? ""
    }
    
    @objc public var appBuildVersion: String {
        Bundle.main.infoDictionary?.stringValue(key: "CFBundleVersion") ?? ""
    }
    
//    @objc public var memoryUsage: Int64 {
//        get {
//            var info = mach_task_basic_info()
//            var size = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size) / 4
//            let kern: kern_return_t = withUnsafeMutableBytes(of: &info) {
//                $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
//                    task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &size)
//                }
//            }
//
//            return 12
//        }
//    }
}

#endif
