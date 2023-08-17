//
//  NSDictionary.swift
//  MN5SwiftKit
//
//  Created by Mornin5 on 2023/8/16.
//

import Foundation

extension NSDictionary {
    @objc public func merge(_ other: NSDictionary) -> NSDictionary {
        return (self as Dictionary).merge(other: other as Dictionary) as NSDictionary
    }
}

extension NSDictionary {
    @objc public func stringValue(_ key: NSString) -> NSString {
        return (self as Dictionary).stringValue(key: String(describing: key)) as NSString
    }
    
    @objc public func intValue(_ key: NSString) -> Int {
        return (self as Dictionary).intValue(key: String(describing: key))
    }
    
    @objc public func boolValue(_ key: NSString) -> Bool {
        return (self as Dictionary).boolValue(key: String(describing: key))
    }
    
    @objc public func mapValue(_ key: NSString) -> NSDictionary {
        return (self as Dictionary).mapValue(key: String(describing: key)) as NSDictionary
    }
}
