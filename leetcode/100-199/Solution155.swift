//
//  Solution155.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 最小栈
// 先有栈的基础操作，入栈，出栈，获取栈顶元素，然后要 获取栈中的最小值
// 删除栈顶后，如果刚好是最小值，如何更新最小值

// 栈的基础数据结构--数组， 或者是链表
// 先用数组
// 借助辅助栈
class MinStack {
    var array:[MinStackNode]?
    // var minValue:Int?
    /** initialize your data structure here. */
    init() {
        array = Array()
    }
    
    func push(_ x: Int) {
        var minValue:Int?
        if array?.last?.min == nil {
            minValue = x
        }else {
            minValue = min(array!.last!.min!, x)
        }
        
        let node = MinStackNode.init(x, minValue!)
        array?.append(node)
    }
    
    func pop() {
        array?.removeLast()
    }
    
    func top() -> Int {
        let node = array?.last
        return node?.val ?? 0
    }
    
    func getMin() -> Int {
        return array?.last?.min ?? 0
    }
}

// 存储当前值和对应的最小值
class MinStackNode {
    let val:Int?
    let min:Int?
    // let
    init(_ val: Int, _ min: Int) {
        self.val = val
        self.min = min
    }
}



// push 3, value: 3, min: 3
// push 2, value: 2:,min: 2
// push 4, value: 4, min: 2
// get min : 2
// pop

//[null,null,null,null,2147483647,null,2147483646,null,2147483646,null,null,2147483647,2147483646,null,-2147483648,-2147483648,null,2147483646]

//预期
// [null,null,null,null,2147483647,null,2147483646,null,2147483646,null,null,2147483647,2147483647,null,-2147483648,-2147483648,null,2147483647]

