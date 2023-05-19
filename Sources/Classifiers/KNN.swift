//
//  File.swift
//  
//
//  Created by Paulo Henrique Gomes da Silva on 08/05/23.
//

import Foundation
import SwiftCSV
import simd

class KNN: Classifier {

    var dataset: ([Iris],[Iris])
    var trainingSet: [(Iris, SIMD4<Double>)]
    var testSet: [(Iris, SIMD4<Double>)]

    init(
        dataset: ([Iris],[Iris]),
        trainingSet: [(Iris, SIMD4<Double>)] = [],
        testSet: [(Iris, SIMD4<Double>)] = []
    ) {
        self.dataset = dataset
        self.trainingSet = trainingSet
        self.testSet = testSet
    }

    func training() {
        trainingSet = dataset.0.map { return ($0, SIMD4<Double>($0.sepalWidthCm, $0.sepalLenghtCm, $0.petalWidthCm, $0.petalLenghtCm)) }
        testSet = dataset.1.map { return ($0, SIMD4<Double>($0.sepalWidthCm, $0.sepalLenghtCm, $0.petalWidthCm, $0.petalLenghtCm)) }
    }

    func prediction(for point: SIMD4<Double>, in trainSet: [(Iris, SIMD4<Double>)], k: Int) -> String {
        var distances = trainSet.map { return ($0.0, simd_distance(point, $0.1)) }
        distances.sort { $0.1 < $1.1 }
        let neighbors = Array(distances[..<k])
        let countSpecies = neighbors.map { $0.0.species }
        let classMostFrequent = countSpecies.reduce(into: [:]) { counts, species in
            counts[species, default: 0] += 1
        }.max { $0.value < $1.value }?.key ?? ""
        return classMostFrequent
    }
}
