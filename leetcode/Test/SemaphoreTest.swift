//
//  SemaphoreTest.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/5/13.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class SemaphoreTest {
    func test() {
        let semaphore = DispatchSemaphore(value: 1)
        print("before lock")
        semaphore.wait()
        print("test lock")
        semaphore.signal()
    }
}
