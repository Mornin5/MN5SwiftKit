//
//  String+substring.swift
//  MN5SwiftKit
//
//  Created by week on 2023/9/8.
//

import Foundation

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
        let endIndex = self.index(startIndex, offsetBy: range.upperBound)
        return String(self[starIndex...endIndex])
    }
}
