//
//  File.swift
//  
//
//  Created by Paulo Henrique Gomes da Silva on 18/05/23.
//

import Foundation

protocol Classifier {
    var dataset: ([Iris],[Iris]) { get }
    var trainingSet: [(Iris, SIMD4<Double>)] { get set }
    var testSet: [(Iris, SIMD4<Double>)] { get set }
    func training()
    func prediction(for point: SIMD4<Double>, in trainSet: [(Iris, SIMD4<Double>)], k: Int) -> String
}
