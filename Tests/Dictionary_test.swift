//
//  test.swift
//  MN5SwiftKit
//
//  Created by week on 2023/8/16.
//

import Foundation
import XCTest
@testable import MN5SwiftKit

class DictionaryCase: XCTestCase {
    let json1: [String: Any] = [
        "name": "week",
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
        
        XCTAssert(json1.stringValue(key: "name") == "week")
        XCTAssert(json1.intValue(key: "age") ==  18)
        XCTAssert(json1.boolValue(key: "handsome") == true)
        
        XCTAssert(json1.merge(other: json2).count == 5)
    }
}
