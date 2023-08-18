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




