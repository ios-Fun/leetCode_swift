//
//  Solution166.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution166 {
    // todo 优化
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        
        var numerator = numerator
        var denominator = denominator
        
        // 返回的字符串
        var resultStr = ""
        
        // 是否为负
        var isPlus = true
        
        //小数点前的数
        var bigValue = 0
        
        var smallValueList:[Int] = Array()
        
        var resultList:[Int] = Array()
        
        if numerator == 0 {
            return "0"
        }
        
        if numerator * denominator < 0 {
            isPlus = false
            if numerator < 0 {
                numerator = 0 - numerator
            }else {
                denominator = 0 - denominator
            }
        }else {
            if numerator < 0 {
                numerator = 0 - numerator
                denominator = 0 - denominator
            }
        }
        
        if numerator < denominator {
            bigValue = 0
        }else {
            bigValue = numerator / denominator
            numerator = numerator % denominator
        }
        
        var tenValue = 0
        
        var loopIndex = -1
        
        while numerator != 0 && loopIndex == -1{
            // 不断的循环
            tenValue = numerator * 10
            let num = tenValue/denominator
            
            numerator = numerator * 10 % denominator
            
            // 判断是否有相同的找到则循环
            if resultList.count > 0 {
                // 遍历
                for i in (0..<resultList.count) {
                    if tenValue == resultList[i] {
                        //print("find index:", i, numerator)
                        loopIndex = i
                        break
                    }
                }
            }
            if loopIndex == -1 {
                smallValueList.append(num)
                resultList.append(tenValue)
            }
        }
        
        if !isPlus {
            resultStr = "-"
        }
        resultStr.append(String.init(bigValue))
        
        //如果有小数字
        if smallValueList.count > 0 {
            resultStr.append(".")
            for i in(0..<smallValueList.count) {
                if i == loopIndex {
                    resultStr.append("(")
                }
                resultStr.append(String.init(smallValueList[i]))
            }
            if loopIndex >= 0 {
                resultStr.append(")")
            }
        }
        
        return resultStr
    }
    
    func test() {
        print(fractionToDecimal(1,6))
        print(fractionToDecimal(1,17))
        print(fractionToDecimal(2,1))
        print(fractionToDecimal(2,3))
        print(fractionToDecimal(-2,-3))
        print(fractionToDecimal(-2,3))
        print(fractionToDecimal(2,-3))
    }
}

//    5.882352941176470
// 17/100
//     85
//     150
//     136
//      140
//      136
//        40
//        34
//         60
//         51
//          90
//          85
//           50
//           34
//           160
//           153
//             70
//             68
//              20
//              17
//               30
//               17
//               130
//               119
//                110
//                102
//                  80
//                  68
//                  120
//                  119
//                    100
//                     85
//                     150
