//
//  TestOutput.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/4/9.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

protocol Animal {
    func run()
}

extension Animal {
    func run() {
        print("Animal run")
    }
}

class Dog: Animal {
    func run() {
        print("Dog run")
    }
}

class TestOutput {
    func test() {
        let animal: Animal = Dog()
        let dog: Dog = Dog()
        animal.run()
        dog.run()
        
    }
}
