//
//  NSString.swift
//  MN5SwiftKit
//
//  Created by Mornin5 on 2023/8/16.
//

import Foundation

/// for objective-c
extension NSString {
    @objc public func contains(_ sub: NSString) -> Bool {
        return String(self).contains(String(sub))
    }
    
    @objc public func sha1() -> NSString {
        return NSString(string: String(self).sha1)
    }
    
    @objc public func md5() -> NSString {
        return NSString(string: String(self).md5)
    }
    
    @objc public func isValidUrl() -> Bool {
        return String(self).isValidUrl
    }
    
    @objc public func urlEncode() -> NSString {
        guard let urlEncodeString = String(self).urlEncode else {return self}
        return NSString(string: urlEncodeString)
    }
    
    @objc public func trim() -> NSString {
        return NSString(string: String(self).trim)
    }
    
    @objc public func toJSONDictionary() -> NSDictionary {
        guard let dictionary = String(self).toJSONDictionary else {return NSDictionary()}
        return dictionary as NSDictionary
    }
}
