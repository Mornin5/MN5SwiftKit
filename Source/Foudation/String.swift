//
//  String.swift
//  MN5SwiftKit
//
//  Created by Mornin5 on 2023/8/16.
//

import Foundation

/// JSON
extension String {
    public var toJSONDictionary: [String: Any]? {
        get {
            guard !self.isEmpty else {return nil}
            guard let dataSelf = self.data(using: .utf8) else {return nil}
            if let dic = try? JSONSerialization.jsonObject(with: dataSelf, options: .allowFragments) as? [String: Any] {
                return dic
            }
            return nil
        }
    }
}

extension String {
    public var urlEncode: String? {addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)}
    public var trim: String {trimmingCharacters(in: .whitespacesAndNewlines)}
    public var isValidUrl: Bool {
        get {
            if let url = URL(string: self), let _ = url.scheme, let _ = url.host { return true }
            return false
        }
    }
}


/// substring from Int range
extension String {
    public func subStringInRange(_ range: Range<Int>) -> String? {
        if range.lowerBound < 0 || range.upperBound > self.count {return nil}
        let starIndex = self.index(startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(startIndex, offsetBy: range.upperBound)
        return String(self[starIndex..<endIndex])
    }
    
    public func subStringInRange(_ range: ClosedRange<Int>) -> String? {
        if range.lowerBound < 0 || range.upperBound > self.count {return nil}
        let starIndex = self.index(startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(startIndex, offsetBy: range.upperBound + 1)
        return String(self[starIndex..<endIndex])
    }
}
