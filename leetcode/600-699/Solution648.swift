//
//  Solution648.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/14.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution648 {
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        let sentenceList = sentence.split(separator: " ")
        var resultList = Array.init(repeating: -1, count: sentenceList.count)
        for (i,sentenceItem) in sentenceList.enumerated() {
            // let sentenceItemChars = Array(sentenceItem)
            var machIndex = -1
            var machCount = 0
            for (index,dictionaryItem) in dictionary.enumerated() {
                if machCount != 0 && dictionaryItem.count > machCount {
                    continue
                }
                if sentenceItem.starts(with: dictionaryItem) {
                    if machCount == 0 {
                        machCount = dictionaryItem.count
                        machIndex = index
                    } else {
                        if dictionaryItem.count < machCount {
                            machCount = dictionaryItem.count
                            machIndex = index
                        }
                    }
                }
            }
            resultList[i] = machIndex
        }
        // print(resultList)
        var resultStr = ""
        for (index, resultItem) in resultList.enumerated() {
            if resultItem == -1 {
                resultStr.append(String(sentenceList[index]))
            } else {
                resultStr.append(dictionary[resultItem])
            }
            if index != resultList.count - 1 {
                resultStr.append(" ")
            }
        }
        return resultStr
    }
    
    func test() {
        print(replaceWords(["cat","bat","rat"], "the cattle was rattled by the battery"))
        print(replaceWords(["a","b","c"], "aadsfasf absbs bbab cadsfafs"))
    }
}
