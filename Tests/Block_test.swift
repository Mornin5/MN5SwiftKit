//
//  Block_test.swift
//  MN5SwiftKitTests
//
//  Created by week on 2023/9/22.
//

import Foundation
import XCTest
@testable import MN5SwiftKit

class BlockCase: XCTestCase {
    
    
    func testVoidBlock() {
        let void_block: VoidBlock = { () in print("this is a void block test")}
        void_block()
    }
    
    func testStringBlock() {
        let string_block: StringBlock = { print($0 as Any) }
        string_block("this is a string block")
    }
}
