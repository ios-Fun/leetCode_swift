//
//  Solution1358.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/12.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation
// dfs -- 超时
// 2. 滑动窗口
class Solution1358 {
    // 滑动窗口
    func numberOfSubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var answer = 0
        var count:[Int] = Array.init(repeating: 0, count: 3)
        var start = 0
        for end in 0..<(chars.count)  {
            let charEnd = String(chars[end])
            if charEnd == "a" {
                count[0] += 1
            }else if charEnd == "b" {
                count[1] += 1
            }else {
                count[2] += 1
            }
            while count[0] >= 1 && count[1] >= 1 && count[2] >= 1 {
                answer += chars.count - end
                let charStart = String(chars[start])
                if charStart == "a" {
                    count[0] -= 1
                }else if charStart == "b" {
                    count[1] -= 1
                }else {
                    count[2] -= 1
                }
                start += 1
            }
        }
        return answer
    }
    
    //dfs
    var count = 0
    var chars:[Character]!
    func numberOfSubstrings2(_ s: String) -> Int {
        chars = Array(s)
        count = 0
        for i in 0..<(chars.count - 2) {
            dfs(curIndex: i, aCount: 0, bCount: 0, cCount: 0)
        }
        return count
    }
    
    func dfs(curIndex: Int, aCount: Int, bCount: Int, cCount: Int) {
        
        if aCount != 0 && bCount != 0 && cCount != 0 {
            self.count += 1
        }
        if curIndex >= chars.count {
            return
        }
        // 选中当前的
        let curValue = chars[curIndex]
        if curValue == "a" {
            dfs(curIndex: curIndex + 1, aCount: aCount + 1, bCount: bCount, cCount: cCount)
        } else if curValue == "b" {
            dfs(curIndex: curIndex + 1, aCount: aCount , bCount: bCount + 1, cCount: cCount)
        } else {
            dfs(curIndex: curIndex + 1, aCount: aCount , bCount: bCount, cCount: cCount + 1)
        }
        
        // 不选中当前的
        // dfs(curIndex: curIndex + 1, aCount: 0 , bCount: 0, cCount: 0)
    }
    
    func test() {
        
        
        print(numberOfSubstrings("cbcbbbcbacaaaabbbacbbbbbcbbcabacaccbbabbaccbbbbbbcabcbbacacbbacbcbbccbaacccbbcbcbcccacaccacacabaaacbaacbacacbcaaacbaacbcabacbcbaaacaacbabcbccabcbbccbacaaabbcabcbbacbbcabccaccccabcacbacabbaababbcacccccbbbccabacabbccabcccaaccabccacaccbcccbbcccbcaacbacbcabcacccacccacacacbcbacabcbabaaabbbabbbbbabacaabbbcbcaaaacabcccbcaacbbcabcbabccbabaaccbcabcbbbaabaaaabcacaaacbbbccbaccbbaaccaabcbcbbcacaaabbaacbaabacccbcbbaabbbaaccbccaacbcbbcbbbbbaaccbabcbacbcacbbcbabacacbbbccaccbcababbacbccbabbcccbaacaababcacbbabaacbbbacbbbbccbbbacbaccbababcaabcccababcbaacbacccbaaacbcbccbcbbbaabbacbbcabcbacbcbcaabcabaccbbccacaabbccacacacbabcbcccabccaabaaacbaacaaabbcccbbcbcacbbbacbbabcbacbbbcbcbbababcbcaaacccababcccacbccabcccbabbbbbccbbccbcaacccababcbcabacbccaacbaccaaacabaaccaccaaacccacbbabacbcbccabbaaabcccacabbbacaaabaabaccbbacacbcabaabbaaabcccacacacbacaccccbccbacccbbbcbacabbbccabccccbccaccbccaacaaacaabcbbacacaccbacbcabbabbccacbbabcabababbbcaababbabccbbacbabcbaccbaaaacaabbacaabbccabccccaaaccacacbbacbaccbabbccccbcabcabbaaccbcbccbbcabbbbccabacaaacabcbacccacababababccacacaaccacaaccabcaccbcacacabbcacabcababcbacaababaccaccbbbbbbabcccbbcacbccacbabcbacbbccbabbacbabbcbaaabbacbbbbbccababacaacacbccabbbcbaaccaabaaaccccbccccaaabaaacaaaabbbbccabccaacabcaacbaacacbcbbccaaabacccbabaaccccababbabaacaccacbbabbcbaabacbbbcaabaabcbccccaabbcbccaaaccbbbcaaaabbababacbccacaccaaccccbbabbcbcabaaaacccacccbaacccabcacbcbccccaacbcbaccacccccbbcaabbaacbcbbabacaababaacccbcaabccbccbababbcccaababbabbaaababcbcbcbaaaccbaaacaacccaabbccbaaacbbcbccbacaabbcaabaccbbacacabacccaaacacacabcabcccbccbabbabbaacaaabbcccaccbabbcbbccacccbabbaccbbcabccbaaccccbacaaaaaaaacbcbaccbaacbbccacbbaccacaccbcbbbbaacccaabbbcccacaabbacaabcbbbbbacbabacbbbaccabbaccabaccbaabaaaaccbcbacacccacbcacbcbcaaacacbcbacacaaacaabbbccbcbbccbccacbbbbacbbaccaabbbbbabaccbaaacacbaaacbaabaaccaacbbcabcbbbacbbccabaaabcabbbacbaacccaabaacccaccbaaccaacccabaacccccbcacaabacababbcbccabbabccbcccaabababbbaaabaaacaaacbbaabaaacbcabbbbacacbbbacaaccbbaabaacacccbabbbbcacbcacabacaacabcccacccbbcacabaaccaacbbaabcbcbcabaccbbabcbbcbcbcaccabcccabacaaaccbcccacababacabbacbabbbbbbcbcccccabababaabbcabbacaaacbabbaacacccaaabcbcbbcbbabbbcbccacabcbaccbacbccaabacacbacbbbbbcbabbbbacabcbcbababbcccacccaabacccabbbccbccaccaaaaabbccccbbcacbaccaabccbbcaaaabbabccbbccabbbcacacccababaaccbbbbababacaccbbaabbbaaabbacbbacaaabcbccacbaaaabcbbbbbccbcabcbbbbaacbcccbaaccabccbbbcabaccaabcbacabaccbccacbbbcbbcccbbbacaccacacabaaacacbcabcbaaacbaaccbbccabaacaaaaacaaccaabcabbccbbcccbcacbcbaaaaccccbcabcbaccbabaabbaccbacaacacacbbabcabbbcccaccacacabbaababbbbabbbccbacabcbaabbaabbaabacacabaabbbacbcbaaccccbacbaabaacaababcccabbbbaaabacccbbcbaaccacaaabcbcabaacaaaaccacabbcccbccaabaccacabcabcbbaaacaaccbaabcbcbcacbacaabaacbbaababacabbabcbbaaabcbabacbcabbacaaacbabbbbabbbaacacbbabccbabaaaacaacbcccabbcbcababbbacacabbcacabcabcabcbaaaabbbabcabbcbbaabbbbccaaaacabbcacccabccbacabbccbbacabcabcabacabbcbbcbabbaaacacabcbacbbaaaacababacaacccbccabccaaabbbabaaacaababbbbcbabbbbaaaccababbbccaabbaacabcabbbcbabbbbaabcaacacbcbbacbcccaccbaaaabaccbbcabaacbccccaacbbcaabbcbaabbababbbcabaccacbabbbbbbbcbbcabccbbababbaacbaccbcabbaccbabcbabbacacbcabbabbaccbbccaccaabacaaababaabcbcbabacbcabbccabccbbabbccbbababbcbbaabcbcbbcbaa"))
        
        print(numberOfSubstrings("abcabc"))

        print(numberOfSubstrings("aaacb"))

        print(numberOfSubstrings("abc"))
    }
}
