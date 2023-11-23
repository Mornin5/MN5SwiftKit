//
//  URL.swift
//  MN5SwiftKit
//
//  Created by week on 2023/11/23.
//

import Foundation

extension URL {
    public func valueInQuery(key: String) -> String? {
        let component = URLComponents(url: self, resolvingAgainstBaseURL: true)
        if let queryItems = component?.queryItems, let item = queryItems.first(where: {$0.name == key}), let value = item.value {
            return value
        }
        return nil
    }
}
