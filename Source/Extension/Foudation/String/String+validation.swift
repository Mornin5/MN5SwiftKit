//
//  String+validation.swift
//  MN5SwiftKit
//
//  Created by week on 2023/9/8.
//

import Foundation

extension String {
    public var isValidUrl: Bool {
        get {
            if let url = URL(string: self), let _ = url.scheme, let _ = url.host { return true }
            return false
        }
    }
    
    public var isValidEmail: Bool {
        get {
            do {
                let emailRegex = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
                let regex = try NSRegularExpression(pattern: emailRegex)
                let results = regex.matches(in: self, range: NSRange(location: 0, length: NSString(string: self).length))
                return results.count != 0
            } catch let error {
                print(error.localizedDescription)
                return false
            }
        }
    }
}
