//
//  Solution108.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/22.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 递归
class Solution108 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        var mid = nums.count % 2 == 0 ? nums.count / 2 : (nums.count / 2 + 1)-1
        // mid = mid - 1
        let root = TreeNode.init(nums[mid])
        if mid == 0 {
            root.left = nil
            root.right = nil
        }else {
            root.left = sortedArrayToBST(Array(nums[0..<mid]))
            if mid < nums.count - 1 {
                root.right = sortedArrayToBST(Array(nums[(mid+1)..<nums.count]))
                // Array(nums[3..<5])
            }else{
                root.right = nil
            }
        }
        return root
    }
    
    func test() {
        let node1 = sortedArrayToBST([-10,-3,0,5,9])
        
        let node2 = sortedArrayToBST([-10,-3,0,5,9])
    }
}
