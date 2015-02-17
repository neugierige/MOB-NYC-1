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
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    private var arrayOfCharacters = [doMath]()
    
    private var knownOperations = [String: doMath]() //DICTIONARY of OPERATIONS
    
    init() {
        knownOperations["+"] = doMath.BinaryOperation("+") { $0 + $1 }
        knownOperations["-"] = doMath.BinaryOperation("-") { $1 - $0 }
        knownOperations["×"] = doMath.BinaryOperation("×") { $0 * $1 }
        knownOperations["÷"] = doMath.BinaryOperation("÷") { $1 / $0 }
        knownOperations["%"] = doMath.UnaryOperation("%") { $0 * 0.01 }
        knownOperations["±"] = doMath.UnaryOperation("±") { $0 * -1 }
    }
    
//    let brain = Brains() //initializing Brains
    
    private func evaluate(operations: [doMath]) -> (result: Double?, remainingOperations: [doMath]) { //returns a TUPLE
        
        if !operations.isEmpty {
            var remainingOperations = operations
            let op = remainingOperations.removeLast()
            switch op {
            case .Numbers(let number):
                return (number, remainingOperations)
                
            case .UnaryOperation(_, let operation):
                let numberEvaluation = evaluate(remainingOperations)
                if let number = numberEvaluation.result {
                    return (operation(number), numberEvaluation.remainingOperations)
                }
            case .BinaryOperation(_, let operation):
                let number1Evaluation = evaluate(remainingOperations)
            if let number1st = number1Evaluation.result {
                let number2Evaluation = evaluate(number1Evaluation.remainingOperations)
                if let number2nd = number2Evaluation.result {
                    return (operation(number1st, number2nd), number2Evaluation.remainingOperations)
                }
                }
            }
            
        }
        return (nil, operations)
    }
    
    func evaluate() -> Double? {
        let (result, remainingOperations) = evaluate(arrayOfCharacters)
        println("current result is: \(result)")
        return result
    }
    
    func pushNumbers(number: Double) -> Double? {
        arrayOfCharacters.append(doMath.Numbers(number))
        return evaluate()
    }
    
    func performCalculations(symbol: String) -> Double? {
        if let calculation = knownOperations[symbol] {
            arrayOfCharacters.append(calculation)
        }
        return evaluate()
    }
    
}




