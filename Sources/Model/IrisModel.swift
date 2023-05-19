//
//  File.swift
//  
//
//  Created by Paulo Henrique Gomes da Silva on 11/05/23.
//

import Foundation

struct Iris: Hashable {
    let id: Int
    let species: String
    let sepalLenghtCm: Double
    let sepalWidthCm: Double
    let petalLenghtCm: Double
    let petalWidthCm: Double

    var vector: SIMD4<Double>? {
        SIMD4<Double>(
            x: sepalLenghtCm,
            y: sepalWidthCm,
            z: petalLenghtCm,
            w: petalWidthCm
        )
    }
}

struct IrisIterator: IteratorProtocol {
    typealias Element = Iris


    var current = 0
    let items: [Iris]

    init(items: [Iris]) {
        self.items = items
    }

    mutating func next() -> Element? {
        if current < items.count {
            let item = items[current]
            current += 1
            return item
        } else {
            return nil
        }
    }
}

extension Iris: Sequence {
    func makeIterator() -> some IteratorProtocol {
        return IrisIterator(items: [self])
    }
}
