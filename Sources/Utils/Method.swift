//
//  File.swift
//  
//
//  Created by Paulo Henrique Gomes da Silva on 16/05/23.
//

import Foundation

class Method<T> {
    var dataset: [T]

    init(dataset: [T] = [T]()) {
        self.dataset = dataset
    }

    func splitData(_ percent: Double = 0.5) -> ([T],[T]) {
        dataset.shuffle()
        var trainingSet = [T]()
        var testSet = [T]()
        let trainingCount = Int(Double(dataset.count) * percent)
        for i in 0..<trainingCount { trainingSet.append(dataset[i]) }
        for i in trainingCount..<dataset.count { testSet.append(dataset[i]) }
        return (trainingSet, testSet)
    }
}
