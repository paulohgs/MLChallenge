//
//  File.swift
//  
//
//  Created by Paulo Henrique Gomes da Silva on 18/05/23.
//

import Foundation

class Validator {
    var classifier: Classifier
    var splittedDataset: Method<Iris>
    var k: Int
    init(
        classifier: Classifier,
        splittedDataset: Method<Iris>,
        k: Int
    ) {
        self.classifier = classifier
        self.splittedDataset = splittedDataset
        self.k = k
    }

    func iteractions(realizations: Int, method: Method<Iris>, k: Int) -> [Double] {
        var mediumHitRate: [Double] = []
        for _ in 0..<realizations {
//            let classifier = KNN(dataset: method.splitData(Double.random(in: 0.4...0.7)))
            classifier.training()
            var hits = 0
            for item in 0..<classifier.testSet.count {
                let prediction = classifier.prediction(for: classifier.testSet[item].1, in: classifier.trainingSet, k: k)
                if classifier.testSet[item].0.species == prediction {
                    hits += 1
                }
            }
            let percentHitRate = Double(Double(hits) / Double(classifier.testSet.count)) * 100
            mediumHitRate.append(percentHitRate)
        }
        return mediumHitRate
    }

}
