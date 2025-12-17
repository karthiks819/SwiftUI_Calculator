//
//  StringHelperFunctions.swift
//  Calc_swiftUI
//
//  Created by Karthik Solleti on 16/12/25.
//

import Foundation

func getLastCharacter(from string: String) -> String {
    string.isEmpty ? "" : String(string.last!)
}


func lastCharacteriSEqualTo(_ string: String, _ character: String) -> Bool {
    let lastChar = getLastCharacter(from: string)
    return lastChar == character
}

func formatResult(value: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    return numberFormatter.string(from: NSNumber(floatLiteral: value)) ?? "0"
}


func lastCharIsDigit(_ string: String) -> Bool {
    return "0123456789".contains(getLastCharacter(from: string))
}

func lastCharIsDigitOrPercent(_ string: String) -> Bool {
    return "0123456789%".contains(getLastCharacter(from: string))
}

func lastCharacterIsAnOperator(str: String) -> Bool {
    let lastChar = getLastCharacter(from: str)
    return operators.contains(lastChar)
}
