//
//  FindNum1.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/2.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 给一个数组，这个数左边的都比它小，右边的都比它大，如[7,4,2,8,9,12]结果是8，9
// 思路：借助两个辅助数组来标记
class FindNum1 {
    func findNum(_ nums:[Int]) -> [Int] {
        
        if nums.count < 3 {
            return []
        }
        
        var list:[Int] = Array()
        var maxNumList: [Int] = [Int](repeating: 0, count: nums.count)
        var minNumList: [Int] = [Int](repeating: 0, count: nums.count)
        var maxNum = nums[0]
        for (index,item) in nums.enumerated() {
            if item > maxNum {
                maxNum = item
            }
            maxNumList[index] = maxNum
        }
        var minValue = nums[nums.count-1]
        for (index,item) in nums.enumerated().reversed() {
            if item < minValue {
                minValue = item
            }
            minNumList[index] = minValue
        }
        
        for i in (1..<nums.count-1) {
            if maxNumList[i] == minNumList[i] && maxNumList[i] > maxNumList[i-1] {
                list.append(nums[i])
            }
        }
        
        return list
    }
    
//    func findOneNum(_ n: Int) -> Int {
//        var nTemp = n
//        var count = 0
//        let nB = String(nTemp, radix: 2)
//        while(nTemp != 0) {
//            if nTemp & 1 == abs(1) {
//                count  = count + 1
//            }
//            nTemp = nTemp >> 1
//        }
//        return count
//    }
    
    func countPositionNumber3(_ number:Int) -> Int {
        var num:Int = number
        var count:Int = 0
        while num != 0 {
            count += 1
            num = num & (num-1)
        }
        return count
    }
    
    // 递归实现1加到100
    func addToNum(_ n: Int) -> Int{
        if n == 1 {
            return 1
        }
        return n + addToNum(n-1)
        //return addNum(0, n)
    }
    
    // 尾递归
    private func addNum(_ result: Int, _ n: Int) -> Int {
        if n == 1 {
            return result + n
        }
        return addNum(result + n, n-1)
    }
    
    func test() {
//        print(findNum([7,4,2,8,9,12]))
//        print(findNum([7,4,2,8,9,3]))
        
//        print(findOneNum(0))
//        print(findOneNum(8))
//        print(findOneNum(9))
      //   print(countPositionNumber3(-8))
        
//        print(9%4)
//        print(9%(-4))
//        print((-9)%4)
//        print((-9)%(-4))
        //print(addToNum(100))
        
        
        // 0 ^ 0  = 0
        // 1 ^ 0 = 1
        // 0 ^ 1 = 1
        // 1 ^ 1 = 0
        
        let arr = [0, 3, 8, 3, 5]
        // let a = 0
        var result = 0
        var zeroCount:Int = 0
        for item in arr {
            if item == 0 {
                zeroCount += 1
                if zeroCount > 1 {
                    print("zeroCount:", zeroCount)
                    break
                }
                continue
            }
            result = item ^ result
            print("result:", result)
        }
    }
}
