//
//  Solution106.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/22.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 递归
//2. 遍历
class Solution106 {
    
    // 遍历
    func buildTree2(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        // todo
        if inorder.count == 0 || postorder.count == 0 {
            return nil
        }
        let rootNode = TreeNode.init(postorder.last!)
        for i in (0..<postorder.count-1).reversed() {
            
        }
        return rootNode
    }
    
    // 递归
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.count == 0 || postorder.count == 0 {
            return nil
        }
        
        let rootNode = TreeNode.init(postorder.last!)
        let rootIndex = findRootIndex(inorder, postorder.last!)
        if rootIndex == 0 {
            rootNode.left = nil
            rootNode.right = buildTree(Array(inorder[(rootIndex+1)..<inorder.count]), Array(postorder[rootIndex..<(postorder.count-1)]))
        }else if rootIndex == inorder.count - 1 {
            rootNode.right = nil
            rootNode.left = buildTree(Array(inorder[0..<rootIndex]), Array(postorder[0..<rootIndex]))
        }else {
            rootNode.left = buildTree(Array(inorder[0..<rootIndex]), Array(postorder[0..<rootIndex]))
            rootNode.right = buildTree(Array(inorder[(rootIndex+1)..<inorder.count]), Array(postorder[rootIndex..<(postorder.count-1)]))
        }
        return rootNode
    }
    
    func findRootIndex(_ list: [Int], _ rootValue: Int) -> Int {
        if list.count == 0 {
            return -1
        }
        for i in (0..<list.count) {
            if list[i] == rootValue {
                return i
            }
        }
        return -1
    }
    
    func test() {
        let node = buildTree([2,1], [2,1])
        
        let node1 = buildTree([9,3,15,20,7], [9,15,7,20,3])
    }
}
