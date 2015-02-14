//
//  Brains.swift
//  CalculatorTake2
//
//  Created by Luyuan Xing on 2/13/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import Foundation

class Brains {
    
    private enum doMath {
        case Numbers(Double)
        case UniaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    private var arrayOfCharacters = [doMath]()
    
    private var knownOperations = [String:doMath]() //DICTIONARY of OPERATIONS
    
    init() {
        knownOperations["+"] = doMath.BinaryOperation("+") { $0 + $1 }
        knownOperations["-"] = doMath.BinaryOperation("-") { $1 - $0 }
        knownOperations["×"] = doMath.BinaryOperation("×") { $0 * $1 }
        knownOperations["÷"] = doMath.BinaryOperation("÷") { $1 / $0 }
        knownOperations["%"] = doMath.UniaryOperation("%") { $0 * 0.01 }
        knownOperations["±"] = doMath.UniaryOperation("±") { $0 * -1 }
    }
    
    let brain = Brains() //initializing Brains
    
    private func evaluate(ops: [doMath]) -> (result: Double?, remainingOperations: [doMath]) { //returns a TUPLE
        
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
    }
    
    func pushNumbers(number: Double) {
        arrayOfCharacters.append(doMath.Numbers(number))
    }
    
    func performCalculations(symbol: String) {
        if let calculation = knownOperations[symbol] {
            arrayOfCharacters.append(calculation)
        }
    }
    
}




