//
//  Solution36.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/16.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 有效的数独
//  只需要看已输入的是不是有效的才行
class Solution36 {
    // 使用hashmap todo
    func isValidSudoku2(_ board: [[Character]]) -> Bool {
        return true
    }
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        for i in (0..<9) {
            var set = Set<Character>()
            for j in (0..<9) {
                let item  = board[i][j]
                if item != "." {
                    if set.contains(item) {
                        return false
                    }else {
                        set.insert(item)
                    }
                }
            }
        }
        
        for j in (0..<9) {
            var set = Set<Character>()
            for i in (0..<9) {
                let item  = board[i][j]
                if item != "." {
                    if set.contains(item) {
                        return false
                    }else {
                        set.insert(item)
                    }
                }
            }
        }
        
        for i in(0...8) {
            let x1 = (i % 3) * 3
            let x2 = (i % 3) * 3 + 2
            let y1 =  (i / 3) * 3
            let y2 = (i / 3) * 3 + 2
            var set = Set<Character>()
            for x in (x1...x2) {
                for y in (y1...y2){
                    let item  = board[x][y]
                    if item != "." {
                        if set.contains(item) {
                            return false
                        }else {
                            set.insert(item)
                        }
                    }
                }
            }
        }
        
        return true
    }
    
    func quickSort(a: inout [Int], low: Int, high: Int) {
        if low >= high { // 递归结束条件
            return
        }
        var i = low
        var j = high
        let key = a[i]
        while i < j {
            // 从右边开始比较，比key大的数位置不变
            while i < j && a[j] >= key {
                j -= 1
            }
            // 只要出现一个比key小的数，将这个数放入左边i的位置
            a[i] = a[j]
            // 从左边开始比较，比key小的数位置不变
            while i < j && a[i] <= key {
                i += 1
            }
            // 只要出现一个比key大的数，将这个数放入右边j的位置
            a[j] = a[i]
        }
        a[i] = key // 将key放入i的位置，则左侧数都比key小，右侧数都比key大
        quickSort(a: &a, low: low, high: i - 1) // 左递归
        quickSort(a: &a, low: i + 1, high: high) // 右递归
    }
    
    func test() {
        
        //var m = [2,3,5,7,1,4,6,15,5,2,7,9,10,15,9,17,12]
        var m = [72, 6, 57, 88, 60, 42, 83, 73, 48, 85]
        quickSort(a: &m, low: 0, high: m.count - 1)
        print(m)
    }
}
