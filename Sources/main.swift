// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation



let dataset = CSVManager.getCSV()
let method = Method<Iris>(dataset: dataset)
let mediumHitRate = iteractions(realizations: 10, method: method, k: 6)
let accurate = Double(mediumHitRate.reduce(0.00) { return $0 + $1 } / Double(mediumHitRate.count))
print(accurate)
//for item in knn.dataset.1 {
////    knn.prediction(for: item, in: knn.trainingMatrix, k: 1)
//}

//print("Acertos: \(countHits)")
//print("Número de testes: \(knn.predictMatrix.count)")
//let hit_rate: Double = Double(countHits) / Double(knn.predictMatrix.count)
//print("Taxa de acerto: \(hit_rate*100)%")


