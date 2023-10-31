//
//  String.swift
//  MN5SwiftKit
//
//  Created by Mornin5 on 2023/8/16.
//

import Foundation

extension String {
    public var urlEncode: String? {addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)}
    public var trim: String {trimmingCharacters(in: .whitespacesAndNewlines)}
}


