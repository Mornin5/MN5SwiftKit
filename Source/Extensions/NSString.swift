//
//  NSString.swift
//  MN5SwiftKit
//
//  Created by week on 2023/8/16.
//

import Foundation

extension NSString {
    @objc public func contains(_ sub: NSString) -> Bool {
        return String(describing: self).contains(String(describing: sub))
    }
}
