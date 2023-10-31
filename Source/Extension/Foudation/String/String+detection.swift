//
//  String+detection.swift
//  MN5SwiftKit
//
//  Created by week on 2023/9/8.
//

import Foundation

extension URL {
    fileprivate var mailScheme: Bool {scheme == "mailto"}
    fileprivate var dropScheme: String {
        get {
            if mailScheme {
                return absoluteString.subStringInRange(7..<absoluteString.count)!
            }
            return absoluteString
        }
    }
}

/// detect from full text
extension String {
    public var urlDetect: [URL] {
        get {
            var urls: [URL] = [URL]()
            do {
                let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
                detector.enumerateMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) { (result, _, _ ) in
                    if let match = result, let url = match.url {
                        urls.append(url)
                    }
                }
            } catch let error  {
                print(error.localizedDescription)
            }
            
            return urls
        }
    }
    
    public var emailDetect: [String] { urlDetect.filter({ $0.mailScheme }).map {$0.dropScheme} }
}
