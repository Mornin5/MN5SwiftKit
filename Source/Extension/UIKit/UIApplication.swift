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
}

extension UIApplication {
    @objc public static func openAppStorePage(_ appId: String) {
        UIApplication.shared.open(URL(string: "itms-apps://itunes.apple.com/app/id\(appId)")!)
    }
}
#endif
