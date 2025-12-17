//
//  ButtonView.swift
//  Calc_swiftUI
//
//  Created by Karthik Solleti on 16/12/25.
//

import SwiftUI

struct ButtonView: View {
    let calcButton: CalcButton
    
    let foregroundColor: Color
    let backgroundColor: Color
    
    var systemImage: String? {
        let value = calcButton.rawValue
        return value.contains("IMG") ? value.replacingOccurrences(of: "IMG", with: "") : nil
    }
    
    var text: String? {
        let value = calcButton.rawValue
        return value.contains("IMG") ? nil : value
    }
    
    let buttonDimensions: CGFloat = UIScreen.main.bounds.width / (UIDevice.isIPad ? 8 : 5)
    
    var body: some View {
        ZStack {
            Text(text ?? "")
            if let systemImage {
                Image(systemName: systemImage)
            }
        }
        .font(UIDevice.isIPad ? .largeTitle : .title2)
        .fontWeight(UIDevice.isIPad ? .heavy : .semibold)
        .frame(width: buttonDimensions, height: buttonDimensions)
        .foregroundStyle(foregroundColor)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(primaryBackgroundColor, lineWidth: 1)
        }
        .shadow(color: backgroundColor.opacity(0.5), radius: 5, x: 5, y: 5)
        
    }
}

#Preview {
    VStack {
        
        ButtonView(
            calcButton: .undo,
            foregroundColor: foregroundDigitsColor,
            backgroundColor: buttonBackgroundColor
        )
        
        ButtonView(
            calcButton: .one,
            foregroundColor: foregroundDigitsColor,
            backgroundColor: buttonBackgroundColor
        )
        
        ButtonView(
            calcButton: .percent,
            foregroundColor: foregroundTopButtonsColor,
            backgroundColor: buttonBackgroundColor
        )
        
        ButtonView(
            calcButton: .percent,
            foregroundColor: foregroundRightButtonsColor,
            backgroundColor: buttonBackgroundColor
        )
    }
}
