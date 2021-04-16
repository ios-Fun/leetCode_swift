//
//  Solution179.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/9.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 弄的复杂了
// 1. 用字符串, swift内置的字符串也能比较大小? 应该是比较每一位
// 2. 当前这种思路,常规思路，繁琐
class Solution179 {
    
    // 字符串比较 -- 相加后比较
    func largestNumber2(_ nums: [Int]) -> String {
        let sort = nums.map {"\($0)"}.sorted { (lStr, rStr) -> Bool in
            return lStr + rStr > rStr + lStr
        }
        let result = sort.joined()
        if result.prefix(1) == "0" {
            return "0"
        } else {
            return result
        }
    }
    
    // 常规思路比较
    func largestNumber(_ nums: [Int]) -> String {
        if nums.count == 0 {
            return ""
        }
        if nums.count == 1 {
            return String(nums[0])
        }
        var numsTemp = nums
        var resultStr:String = ""
        
        // 可以用快速排序
        for i in (0..<numsTemp.count) {
            for j in (i+1..<numsTemp.count) {
                if compare(numsTemp[i], numsTemp[j]) {
                    // 交换
                    let temp = numsTemp[i]
                    numsTemp[i] = numsTemp[j]
                    numsTemp[j] = temp
                }
            }
            if numsTemp[i] == 0 && resultStr.count == 0{
                continue
            }
            resultStr.append(String(numsTemp[i]))
            // print(resultStr)
        }
        return resultStr.count == 0 ? "0" : resultStr
    }
    
    // true-> num1 < _num2
    // 3544---3061比较
    func compare(_ num1:Int, _ num2:Int) -> Bool {
        if num1 == num2 {
            return false
        }
        // 比较首位
        var temp1 = num1
        var temp2 = num2
        var percentNum1 = 0
        var percentNum2 = 0
        repeat {
            // 710 -- 7100
            if temp1 == temp2 && temp1 != 0{
                return false
            }
            let result1 = rightMove(temp1, &percentNum1)
            let result2 = rightMove(temp2, &percentNum2)
            if result1.firstNum < result2.firstNum {
                return true
            }else if (result1.firstNum > result2.firstNum) {
                return false
            }
            
            temp1 = percentNum1 == 0 ? num1 :result1.remainNum
            temp2 = percentNum2 == 0 ? num2 :result2.remainNum
        }while(true)
    }
    
    // 如何得到首位
    func rightMove(_ num:Int, _ percentNum:inout Int) -> (firstNum:Int, remainNum:Int) {
        if num < percentNum {
            percentNum = percentNum / 10
            return (0, num)
        }
        var temp = num
        var count = 1
        while(temp >= 10) {
            temp = temp / 10
            count = count * 10
        }
        
        if percentNum == 0 {
            if count == 1 {
                percentNum = 0
                return (temp, temp)
            }else {
                percentNum = count / 10
                return (temp, num - temp * count)
            }
        }else {
            if count < percentNum {
                percentNum = percentNum / 10
                return (0, temp)
            }else {
                if count == 1 {
                    percentNum = 0
                    return (temp, temp)
                }else {
                    percentNum = count / 10
                    return (temp, num - temp * count)
                }
            }
        }
    }
    
    // 快速排序--时间快一点
    
    
    func test() {
        
        print(largestNumber2([1, 0]))
        print(largestNumber([7100, 710]))
        print(largestNumber([88,8888]))
        print(largestNumber([8,8888]))
        print(largestNumber([888,8888]))
       //print(largestNumber([800, 8054,8012]))
        print(largestNumber([9051,5526,2264,5041,1630,5906,6787,8382,4662,4532,6804,4710,4542,2116,7219,8701,8308,957,8775,4822,396,8995,8597,2304,8902,830,8591,5828,9642,7100,3976,5565,5490,1613,5731,8052,8985,2623,6325,3723,5224,8274,4787,6310,3393,78,3288,7584,7440,5752,351,4555,7265,9959,3866,9854,2709,5817,7272,43,1014,7527,3946,4289,1272,5213,710,1603,2436,8823,5228,2581,771,3700,2109,5638,3402,3910,871,5441,6861,9556,1089,4088,2788,9632,6822,6145,5137,236,683,2869,9525,8161,8374,2439,6028,7813,6406,7519]))
        //print(largestNumber([6519,3644,6331,2934,568,4091,9683,4491,7259,1817,8012,5351,6257,5944,5867,6458,6069,8127,2090,7718,43,3884,8377,1746,1609,3570,751,4899,835,4761,5572,6298,549,3208,9409,4502,7965,5858,6563,7282,5120,5475,2842,2067,9238,1281,9802,5111,9226,8054,6357,4621,5194,762,6544,9149,3005,3864,232,3486,3782,3937,7972,2395,8484,5245,610,3669,890,8615,6552,9008,6905,5008,6058,2261,5899,387,800,7989,2989,7534,5183,7526,6875,3557,7779,8384,7745,3038,694,5599,3879,9253,1551,2958,2095,4242,1773,2689]))
        print(largestNumber([824,8247]))
        print(largestNumber([88,8888]))
        print(largestNumber([8,8888]))
        print(largestNumber([888,8888]))
        print(largestNumber([0,0]))
        print(largestNumber([10,2]))
        print(largestNumber([3,30,34,5,9]))
        print(largestNumber([3544,3013,3061,468]))
        print(largestNumber([824,938,1399,5607,6973,5703,9609,4398,8247]))
        
        //"9609938824782469735703560743981399"
        //"9609938824824769735703560743981399"
        // 9609938824824769735703560743981399
        
        //"995998549642963295795569525905189958985890288238775871870185978591838283748308830827481618052787813771758475277519744072727265721971071006861683682268046787640663256310614560285906582858175752573156385565552654905441522852245213513750414822478747104662455545424532434289408839763963946391038663723370035134023393328828692788270926232581243924362362304226421162109163016131603127210891014"
        
        //"995998549642963295795569525905189958985890288238775871870185978591838283748308830827481618052787813771758475277519744072727265721971007106861683682268046787640663256310614560285906582858175752573156385565552654905441522852245213513750414822478747104662455545424532434289408839763963946391038663723370035134023393328828692788270926232581243924362362304226421162109163016131603127210891014"
    }
}
