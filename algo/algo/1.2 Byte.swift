//
//  1.2 Byte.swift
//  algo
//
//  Created by Vladislav Cheremisov on 07.04.2026.
//

import Foundation

func byte() {
    dump("---------------------------------------------------------------------")

    // Диапазоны
    let ranges = (
        unsigned: UInt8.min...UInt8.max,  // 0...255
        signed:   Int8.min...Int8.max     // -128...127
    )
    dump(ranges)

    // Data ↔ String
    let data = Data([0x48, 0x65, 0x6C, 0x6C, 0x6F])
    let dataInfo = (
        hex:    data,
        string: String(data: data, encoding: .utf8)!
    )
    dump(dataInfo)

    // Data ↔ [UInt8]
    let bytes = (
        array: [UInt8](data),
        count: data.count
    )
    dump(bytes)

    // Число → байты (little-endian на Apple)
    var number: UInt32 = 42
    let numberBytes = (
        number: number,
        bytes:  withUnsafeBytes(of: &number) { Array($0) }
    )
    dump(numberBytes)

    // Байты → число
    let restored = (
        value: numberBytes.bytes.withUnsafeBytes {
            $0.loadUnaligned(as: UInt32.self)
        },
        type: "\(UInt32.self)"
    )
    dump(restored)

    // Big-endian / Little-endian
    let endianness = (
        littleEndian: withUnsafeBytes(of: &number) { Array($0) },
        bigEndian:    withUnsafeBytes(of: number.bigEndian) { Array($0) }
    )
    dump(endianness)

    // Identifier пример
    var identifier = 10529

    let idBytes = (
        identifier: identifier,
        bytes:      withUnsafeBytes(of: &identifier) { Array($0) }
    )
    dump(idBytes)

    // Побитовый доступ к байту
    let nibbles = (
        and:        String((0xAB as UInt8) & 0b1111_0000, radix: 2),
        highNibble: (0xAB as UInt8) >> 4,
        lowNibble:  (0xAB as UInt8) & 0x0F
    )
    dump(nibbles)

    // Размеры типов
    let sizes = (
        uint8:  MemoryLayout<UInt8>.size,
        uint16: MemoryLayout<UInt16>.size,
        uint32: MemoryLayout<UInt32>.size,
        uint64: MemoryLayout<UInt64>.size,
        int:    MemoryLayout<Int>.size
    )
    dump(sizes)
}
