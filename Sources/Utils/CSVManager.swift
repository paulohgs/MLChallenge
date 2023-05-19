//
//  File.swift
//  
//
//  Created by Paulo Henrique Gomes da Silva on 08/05/23.
//

import Foundation
import SwiftCSV

struct CSVManager {

    static func getCSV() -> [Iris] {
        guard let csvStringPath = Bundle.module.url(forResource: "iris", withExtension: "csv") else { preconditionFailure("Arquivo não encontrado") }
        do {
            var iris: [Iris] = []
            let csvFile = try CSV<Named>(url: csvStringPath, delimiter: .comma)
            for row in csvFile.rows {
                let irisItem = Iris(
                    id: Int(row["Id"]!)!,
                    species: row["Species"]!,
                    sepalLenghtCm: Double(row["SepalLengthCm"]!)!,
                    sepalWidthCm: Double(row["SepalWidthCm"]!)!,
                    petalLenghtCm: Double(row["PetalLengthCm"]!)!,
                    petalWidthCm: Double(row["PetalWidthCm"]!)!
                )
                iris.append(irisItem)
            }
            return iris
        } catch {
            print(error)
            return []
        }
    }
}
