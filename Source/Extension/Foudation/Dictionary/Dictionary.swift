//
//  Dictionary.swift
//  MN5SwiftKit
//
//  Created by Mornin5 on 2023/8/16.
//

import Foundation

/// Specific Type Value for Dictionary
extension Dictionary {
    public func valueFor(key: String) -> Any? {
        if self.isEmpty {return nil}
        guard let v = self[key as! Key] else {return nil}
        return v
    }
    
    public func stringValue(key: String) -> String {
        guard let v = valueFor(key: key) else {return ""}
        if let v = v as? String {return v}
        if let v = v as? Int {return String(v)}
        if let v = v as? Double {return String(v)}
        return ""
    }

    public func boolValue(key: String) -> Bool {
        guard let v = valueFor(key: key) else {return false}
        if let v = v as? Bool {return v}
        if let v = v as? String {return v.lowercased() == "true" || v.lowercased() == "yes"}
        return false
    }
    
    public func intValue(key: String) -> Int {
        guard let v = valueFor(key: key) else {return 0}
        if let v = v as? Int {return v}
        if let v = v as? NSNumber {return v.intValue}
        if let v = v as? String, let v = Int(v) {return v}
        if let v = v as? Double {return Int(v)}
        return 0
    }
    
    public func doubleValue(key: String) -> Double {
        guard let v = valueFor(key: key) else {return 0.0}
        if let v = v as? Double {return v}
        if let v = v as? Float {return Double(v)}
        if let v = v as? NSNumber {return v.doubleValue}
        if let v = v as? String, let v = Double(v) {return v}
        if let v = v as? Int {return Double(v)}
        return 0.0
    }
    
    public func listValue(key: String) -> [Any] {
        if let v = valueFor(key: key) as? [Any] {return v}
        return [Any]()
    }
    
    public func mapValue(key: String) -> [String: Any] {
        if let v = valueFor(key: key) as? [String: Any] {return v}
        return [String: Any]()
    }
}

/// JSON
extension Dictionary {
    /// dic -> json string
    public var jsonString: String? {
        get {
            if let data = try? JSONSerialization.data(withJSONObject: self), let string = String.init(data: data, encoding: .utf8) {
                return string
            }
            return nil
        }
    }
}

/// merge two dictionary
extension Dictionary {
    /// 合并两个Dictionary
    @inlinable public func merge(other dic: [Key : Value]) -> [Key: Value] {
        return merging(dic) { (current, _) in current }
    }
}
