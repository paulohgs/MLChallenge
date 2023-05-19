//
//  File.swift
//  
//
//  Created by Paulo Henrique Gomes da Silva on 18/05/23.
//

import Foundation

class DMC: Classifier {
    var trainingSet: [(Iris, SIMD4<Double>)]

    var testSet: [(Iris, SIMD4<Double>)]

    var dataset: ([Iris], [Iris])
    

    init(
        dataset: ([Iris], [Iris]),
        trainingSet: [(Iris, SIMD4<Double>)] = [],
        testSet: [(Iris, SIMD4<Double>)] = []
    ) {
        self.dataset = dataset
        self.trainingSet = trainingSet
        self.testSet = testSet
    }

    func training() {
        //
    }

    func prediction(for point: SIMD4<Double>, in trainSet: [(Iris, SIMD4<Double>)], k: Int) -> String {
        //
        return ""
    }
}
