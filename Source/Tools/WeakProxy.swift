//
//  WeakProxy.swift
//  MN5SwiftKit
//
//  Created by week on 2023/10/31.
//

import Foundation

public func weakProxy(handler: () -> Void) {
    handler()
}
