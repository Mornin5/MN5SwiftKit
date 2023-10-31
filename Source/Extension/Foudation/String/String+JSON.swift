//
//  String+JSON.swift
//  MN5SwiftKit
//
//  Created by week on 2023/9/8.
//

import Foundation

/// JSON
extension String {
    public var toJSONDictionary: [String: Any]? {
        get {
            guard !self.isEmpty else {return nil}
            guard let dataSelf = self.data(using: .utf8) else {return nil}
            if let json = try? JSONSerialization.jsonObject(with: dataSelf, options: .allowFragments) as? [String: Any] {
                return json
            }
            return nil
        }
    }
}
