//
//  1.1 Number Systems.swift
//  algo
//
//  Created by Vladislav Cheremisov on 06.04.2026.
//

func numberSystems() {
    let number  = 42        // 10
    let _       = 0b101010  // 2
    let _       = 0o52      // 8
    let _       = 0x2A      // 16

    let formats = (
        binary: String(number, radix: 2, uppercase: true),
        octal:  String(number, radix: 8, uppercase: true),
        hex:    String(number, radix: 16, uppercase: true)
    )
    dump(formats)

    let parsed = (
        binary: Int(formats.binary, radix: 2)!,
        octal:  Int(formats.octal, radix: 8)!,
        hex:    Int(formats.hex, radix: 16)!
    )
    dump(parsed)

    let converted = (
        binary: convert(255, radix: 2),
        hex:    convert(255, radix: 16)
    )
    dump(converted)
}

func convert(_ number: Int, radix: Int) -> String {
    return String(number, radix: radix)
}
