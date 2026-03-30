//
//  main.swift
//  algo
//
//  Created by Vladislav Cheremisov on 30.03.2026.
//

import Foundation

// 1.1 number systems
let decimal = 42        // 10
let binary = 0b101010   // 2
let octal = 0o52        // 8
let hex = 0x2A          // 16

let number = 42
let binaryString = String(number, radix: 2)
let octalString = String(number, radix: 8)
let hexString = String(number, radix: 16)

print("binaryString: \(binaryString)")
print("octalString: \(octalString)")
print("hexString: \(hexString)")

print("binary: \(Int("101010", radix: 2)!)")
print("octal: \(Int("52", radix: 8)!)")
print("hex: \(Int("2A", radix: 16)!)")

func convert(_ number: Int, radix: Int) -> String {
    return String(number, radix: radix)
}

print("binary: \(convert(255, radix: 2))")
print("binary: \(convert(255, radix: 16))")

// 1.2 byte
let unsByte: UInt8 = 255
let byte: Int8 = 127

let data = Data([0x48, 0x65, 0x6C, 0x6C, 0x6F]) // [72, 101, 108, 108, 111]
let string = String(data: data, encoding: .utf8)
print("string: \(string!)")

for byte in data {
    print(byte)
}

let bytes = [UInt8](data)
print("bytes: \(bytes)")

var number1: UInt32 = 42
let bytes1 = withUnsafeBytes(of: &number1) { Array($0) }
print(bytes)

let value = bytes1.withUnsafeBytes {
    $0.load(as: UInt32.self)
}
print(value)

var identifire = 10529
let idByte = withUnsafeBytes(of: &identifire) { Array($0) }
print(idByte)

// 1.3
let totalBottles = 1000
let totalIndicators = 10
let poisonedBottle = Int.random(in: 0..<totalBottles)
var resultBits = Array(repeating: 0, count: totalIndicators)

for bit in 0..<totalIndicators {
    if ((1 << bit) & poisonedBottle) != 0 {
        resultBits[bit] = 1
    }
}

var detectedBottle = 0

for (index, bit) in resultBits.enumerated() {
    if bit == 1 {
        detectedBottle += (1 << index)
    }
}

print(poisonedBottle)
print(detectedBottle)
