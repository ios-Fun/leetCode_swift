//
//  Solution654.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/17.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution654 {
    
    var nums:[Int]!
    
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        self.nums = nums
        if nums.count == 0 {
            return nil
        }
        return createTree(0, nums.count-1)
    }
    
    func createTree(_ left:Int, _ right: Int) -> TreeNode? {
        // nums.max
        let maxIndex = getMaxIndex(left, right)
        let root = TreeNode(nums[maxIndex])
        if left == right {
            return root
        }
        if left == maxIndex {
            root.left = nil
        }else {
            root.left = createTree(left, maxIndex - 1)
        }
        if right == maxIndex {
            root.right = nil
        }else {
            root.right = createTree(maxIndex + 1, right)
        }
        return root
    }
    
    // 获取最大值的 index
    func getMaxIndex(_ left:Int, _ right: Int)-> Int {
        if left == right {
            return left
        }
        var maxIndex = left
        // var maxValue = nums[left]
        for i in (left+1)...right {
            if nums[maxIndex] < nums[i] {
                maxIndex = i
            }
        }
        return maxIndex
    }
    
    func test() {
        let root = constructMaximumBinaryTree([3,2,1,6,0,5])
        
        print("aaa")
    }
}
