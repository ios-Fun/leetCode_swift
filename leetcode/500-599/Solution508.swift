//
//  Solution508.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/31.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution508 {
    var dic:[Int:Int] = [:]
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        
        dic = [:]
        _ = dfs(root)
        // print(dic)
        var maxCount = 0
        for (_, item) in dic.enumerated() {
            maxCount = max(maxCount, item.value)
        }
        var result:[Int] = []
        for (_, item) in dic.enumerated() {
            if item.value == maxCount {
                result.append(item.key)
            }
        }
        return result
    }
    
    // 后根遍历
    func dfs(_ root: TreeNode?) -> Int?{
        guard let root = root else {
            return nil
        }
        let leftValue = dfs(root.left)
        let rightValue = dfs(root.right)
        let value = (leftValue ?? 0) + root.val + (rightValue ?? 0)
        if (dic[value] != nil) {
            dic[value]! += 1
        }else {
            dic[value] = 1
        }
        return value
    }
    
    func test() {
        print(findFrequentTreeSum(nil))
        
        let nodea1 = TreeNode(5)
        let nodea2 = TreeNode(2)
        let nodea3 = TreeNode(-3)
        nodea1.left = nodea2
        nodea1.right = nodea3
        print(findFrequentTreeSum(nodea1))
        
        print(findFrequentTreeSum(nodea3))
        
        let nodeb1 = TreeNode(5)
        let nodeb2 = TreeNode(2)
        let nodeb3 = TreeNode(-5)
        nodeb1.left = nodeb2
        nodeb1.right = nodeb3
        print(findFrequentTreeSum(nodeb1))
    }
}
