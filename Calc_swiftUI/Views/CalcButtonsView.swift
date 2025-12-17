//
//  CalcButtonView.swift
//  Calc_swiftUI
//
//  Created by Karthik Solleti on 16/12/25.
//

import SwiftUI

struct CalcButtonModel: Identifiable {
    let id = UUID()
    let calcButton:CalcButton
    var color: Color = foregroundDigitsColor
    
}

struct RowOfCalcButtonsModel: Identifiable {
    let id = UUID()
    let row: [CalcButtonModel]
}

struct CalcButtonsView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonData:[RowOfCalcButtonsModel] = [
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .clear, color: foregroundTopButtonsColor),
            CalcButtonModel(calcButton: .negative, color: foregroundTopButtonsColor),
            CalcButtonModel(calcButton: .percent, color: foregroundTopButtonsColor),
            CalcButtonModel(calcButton: .divide, color: foregroundRightButtonsColor),
        ]),
        
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .seven),
            CalcButtonModel(calcButton: .eight),
            CalcButtonModel(calcButton: .nine),
            CalcButtonModel(calcButton: .multiply, color: foregroundRightButtonsColor)
        ]),
        
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .four),
            CalcButtonModel(calcButton: .five),
            CalcButtonModel(calcButton: .six),
            CalcButtonModel(calcButton: .subtract, color: foregroundRightButtonsColor)
        ]),
        
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .one),
            CalcButtonModel(calcButton: .two),
            CalcButtonModel(calcButton: .three),
            CalcButtonModel(calcButton: .add, color: foregroundRightButtonsColor)
        ]),
        
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .undo),
            CalcButtonModel(calcButton: .zero),
            CalcButtonModel(calcButton: .decimal),
            CalcButtonModel(calcButton: .equal, color: foregroundRightButtonsColor)
        ])
    ]
    var body: some View {
        Grid {
            ForEach(buttonData) { rowOfCalcButtonsModel in
                GridRow {
                    ForEach(rowOfCalcButtonsModel.row) { calcButtonModel in
                        Button {
                            print("button pressed \(calcButtonModel.calcButton.rawValue)")
                            
                            buttonPressed(calcButton: calcButtonModel.calcButton)
                        } label: {
                            ButtonView(calcButton: calcButtonModel.calcButton, foregroundColor: calcButtonModel.color, backgroundColor: buttonBackgroundColor)
                        }
                        
                    }
                }
            }
        }
        .padding()
        .background(secondaryBackgroundColor
            .cornerRadius(UIDevice.isIPad ? 40 : 20))
    }
    
    func buttonPressed(calcButton: CalcButton) {
        switch calcButton {
        case .clear:
            currentComputation = ""
            mainResult = "0"
            
        case .negative, .equal:
            print("neg/eql")
            if !currentComputation.isEmpty {
                if !lastCharacterIsAnOperator(str: currentComputation) {
                    let sign = calcButton == .negative ? -1.0 : 1.0

                    mainResult = formatResult(value: sign * calculateResults())
                    
                    if calcButton == .negative {
                        currentComputation = mainResult
                    }
                }
                
            }
        case .decimal:
            print("decimal")
            if let lastOccurenceOfDecimal = currentComputation.lastIndex(of: ".") {
                if lastCharIsDigit(currentComputation) {
                    let startIndex = currentComputation
                        .index(lastOccurenceOfDecimal, offsetBy: 1)
                    let endIndex = currentComputation
                        .endIndex
                    let range = startIndex..<endIndex
                    
                    let rightSubString = String(currentComputation[range])
                    
                    // Only have digits to the right "."
                    // that means do not add anothr "."
                    // otherwise we can add another
                    // decimal point
                    
                    // 23.37+108 Good -> 23.37+108.
                    // 123.45 Bad -> Remains 123.45
                    if Int(rightSubString) == nil && !rightSubString.isEmpty {
                        currentComputation += "."
                    }
                }
            } else {
                if currentComputation.isEmpty {
                    currentComputation += "0."
                } else if lastCharIsDigit(currentComputation) {
                    currentComputation += "."
                }
            }
        case .percent:
            print("percent")
            
            if lastCharIsDigit(currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
            
        case .add, .subtract, .divide, .multiply:
            print("asdm")
            if lastCharIsDigitOrPercent(currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
            
        case .undo:
            print("undo")
            currentComputation = String(currentComputation.dropLast())
        default:
            print("digits")
            appendToCurrentComputation(calcButton: calcButton)
        
        }
    }
    
    func appendToCurrentComputation(calcButton: CalcButton) {
        currentComputation += calcButton.rawValue
    }
    
    // Implements the actual computation
    func calculateResults() -> Double {
        let visibleWorkings: String = currentComputation
        var workings = visibleWorkings.replacingOccurrences(
            of: "%",
            with: "*0.01")
        workings = workings
            .replacingOccurrences(
                of: multiplySymbol,
                with: "*")
        workings = workings
            .replacingOccurrences(
                of: divisionSymbol,
                with: "/")
        
        // If we have "35." this will be replaced
        // by "35.0"
        if getLastCharacter(from: visibleWorkings) == "." {
            workings += "0"
        }
        
        // Key point !
        // Actual computation
        let expr = NSExpression(format: workings)
        let exprValue = expr
            .expressionValue(with: nil, context: nil) as! Double
        
        return exprValue

    }
}

#Preview {
    CalcButtonsView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
}
