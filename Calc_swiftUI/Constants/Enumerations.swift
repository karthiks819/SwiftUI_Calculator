//
//  Enumerations.swift
//  Calc_swiftUI
//
//  Created by Karthik Solleti on 16/12/25.
//

import Foundation

enum Operation {
    case add, subtract, multiply, divide, equal, none
}


enum CalcButton: String,  CaseIterable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "÷"
    case decimal = "."
    case equal = "="
    case percent = "%"
    case clear = "AC"
    case negative = "IMGplus.forwardslash.minus"
    case undo = "IMGarrow.counterclockwise"
    
}


let enumOperators: [CalcButton] = [.add, .subtract, .multiply, .divide]

let multiplySymbol = CalcButton.multiply.rawValue
let divisionSymbol = CalcButton.divide.rawValue

let operators = "+-\(multiplySymbol)\(divisionSymbol)"


