//
//  test.swift
//  MN5SwiftKit
//
//  Created by Mornin5 on 2023/8/16.
//

import Foundation
import XCTest
@testable import MN5SwiftKit

class DictionaryCase: XCTestCase {
    let json1: [String: Any] = [
        "name": "Mornin5",
        "age": 18,
        "handsome": "true",
        "books": [["1sa"], "Funny Kit"] as [Any],
    ]
    
    let json2: [String: Any] = [
        "class": 34,
    ]
    
    func testDic() {
        print(json1.listValue(key: "books"))
        print(json1.merge(other: json2))
        
        XCTAssert(json1.stringValue(key: "name") == "Mornin5")
        XCTAssert(json1.intValue(key: "age") ==  18)
        XCTAssert(json1.boolValue(key: "handsome") == true)
        XCTAssert(json1.merge(other: json2).count == 5)
    }
    
    func testMd5() {
        XCTAssert("week is perfect".md5 == "9972548b82f2b792d6c04551fdc0f83f")
    }
    func testSha1() {
        XCTAssert("week is perfect".sha1 == "b72dc07c39702d471e045d41bdea6f64686a082a")
    }
}
