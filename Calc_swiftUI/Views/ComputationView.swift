//
//  ComputationView.swift
//  Calc_swiftUI
//
//  Created by Karthik Solleti on 16/12/25.
//

import SwiftUI

struct ComputationView: View {
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack(spacing: 10){
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundStyle(foregroundDigitsColor)
                    .font(UIDevice.isIPad ? .largeTitle : .body)
                    .lineLimit(1)
            }
            .minimumScaleFactor(0.1)
            
            HStack {
                Spacer()
                Text(mainResult)
                    .foregroundStyle(foregroundDigitsColor)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }
            .minimumScaleFactor(0.1)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ComputationView(currentComputation: "5222+1", mainResult: "52223")
}
