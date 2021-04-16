//
//  Solution501.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/11.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 进阶： 不采用额外的空间

class Solution501 {
    // 1. 中序遍历，遍历数组查找元素最多的，然后遍历数组输出
    func findMode(_ root: TreeNode?) -> [Int] {
        
        var result:[Int] = Array()
        // 1. 中序遍历
        var stack:[TreeNode] = []
        var cur = root
        var maxCount = 0
        var curCount = 0
        var preValue:Int?
        while cur != nil || stack.count > 0 {
            // 先一直往左把node加入stack
            while cur != nil {
                stack.append(cur!)
                cur = cur!.left
            }
            
            // 取出栈顶元素
            let topNode = stack.removeLast()
            
            // 取值
            // result.append(topNode.val)
            if preValue == nil {
                maxCount = 1
                curCount = 1
            }else {
                if topNode.val == preValue {
                    curCount += 1
                    maxCount = max(maxCount, curCount)
                }else {
                    curCount = 1
                }
            }
            preValue = topNode.val
            cur = topNode.right
        }
        print("maxCount:", maxCount)
        
        // 再来一次遍历
        cur = root
        curCount = 0
        preValue = nil
        stack.removeAll()
        while cur != nil || stack.count > 0 {
            while cur != nil {
                stack.append(cur!)
                cur = cur!.left
            }
            // pop stack
            let topNode = stack.removeLast()
            if preValue == nil {
                curCount = 1
                if curCount == maxCount {
                    result.append(topNode.val)
                }
            }else {
                if preValue! == topNode.val {
                    curCount += 1
                    if curCount == maxCount {
                        result.append(topNode.val)
                    }
                }else {
                    curCount = 1
                    if curCount == maxCount {
                        result.append(topNode.val)
                    }
                }
            }
            preValue = topNode.val
            cur = topNode.right
        }
        
        return result
    }
    
    func test() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        node1.right = node2
        node2.left = node3
        print(findMode(node1))
    }
}
