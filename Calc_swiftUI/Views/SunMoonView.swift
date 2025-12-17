//
//  SunMoonView.swift
//  Calc_swiftUI
//
//  Created by Karthik Solleti on 16/12/25.
//

import SwiftUI

struct SunMoonView: View {
    var lightMode: Bool
    
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "sun.min")
                .foregroundStyle(lightMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor)
            Image(systemName: "moon")
                .foregroundStyle(lightMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor )
        }
        .imageScale(.large)
        .font(UIDevice.isIPad ? .largeTitle : .body)
        .fontWeight(UIDevice.isIPad ? .semibold : .regular)
        .padding()
        .background(Color.secondaryBackground)
        .cornerRadius(20)
    }
}

#Preview {
    VStack {
        SunMoonView(lightMode: true)
        SunMoonView(lightMode: false)
    }
}
