//
//  TestHelpers.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/2/21.
//

import Foundation

struct TestHelpers {
    static let timeout: Double = 10

    static func wait(_ timeInterval: TimeInterval, execute: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval, execute: execute)
    }
}
