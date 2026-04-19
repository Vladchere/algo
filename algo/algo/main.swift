//
//  main.swift
//  algo
//
//  Created by Vladislav Cheremisov on 30.03.2026.
//

import Foundation

//numberSystems() // 1.1
//byte() // 1.2

//// 1.3
//let totalBottles = 1000
//let totalIndicators = 10
//let poisonedBottle = Int.random(in: 0..<totalBottles)
//var resultBits = Array(repeating: 0, count: totalIndicators)
//
//for bit in 0..<totalIndicators {
//    if ((1 << bit) & poisonedBottle) != 0 {
//        resultBits[bit] = 1
//    }
//}
//
//var detectedBottle = 0
//
//for (index, bit) in resultBits.enumerated() {
//    if bit == 1 {
//        detectedBottle += (1 << index)
//    }
//}
//
//print(poisonedBottle)
//print(detectedBottle)

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int: Int] = [:] // num: index

    for (index, num) in nums.enumerated() {
        let diff = target - num

        if let find = dict[diff] {
            return [index, find]
        }

        dict[num] = index
    }

    return []
}

func isPalindrome(_ x: Int) -> Bool {
    var left = 0
    var right = String(x).count - 1
    let numbers: [Character] = Array(String(x))

    while left <= right {
        if numbers[left] != numbers[right] {
            return false
        }

        left += 1
        right -= 1
    }

    return true
}

func isPalindrome2(_ x: Int) -> Bool {
    if x <= 0 {
        return false
    }

    var number = x
    var reversed = 0

    while number > 0 {
        reversed = reversed * 10 + number % 10
        number = number / 10
    }

    return x == reversed
}

func romanToInt(_ s: String) -> Int {
    let map: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    
    var result = 0
    var prev = 0
    
    for char in s {
        guard let curr = map[char] else { return 0 }
        
        if prev < curr {
            result -= prev
        } else {
            result += prev
        }
        
        prev = curr
    }
    
    return result + prev
}

print("--- \(romanToInt("III"))")
