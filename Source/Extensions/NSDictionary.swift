//
//  NSDictionary.swift
//  MN5SwiftKit
//
//  Created by week on 2023/8/16.
//

import Foundation

extension NSDictionary {
    @objc public func merge(_ other: NSDictionary) -> NSDictionary {
        return (self as Dictionary).merge(other: other as Dictionary) as NSDictionary
    }
}
