//
//  ContentView.swift
//  Calc_swiftUI
//
//  Created by Karthik Solleti on 16/12/25.
//

import SwiftUI

struct MainCalculatorView: View {
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                primaryBackgroundColor.ignoresSafeArea()
                VStack {
                    SunMoonView(lightMode: lightMode)
                        .onTapGesture {
                            withAnimation {
                                lightMode.toggle()
                            }
                        }
                    Spacer()
                    
                    ComputationView(
                        currentComputation: currentComputation,
                        mainResult: mainResult
                    )
                    .padding(.horizontal,
                             UIDevice.isIPad ?  geometry.size.width * 0.1 : 0)
                    
                    Spacer()
                    
                    CalcButtonsView(
                        currentComputation: $currentComputation,
                        mainResult: $mainResult
                    )
                    
                    if UIDevice.isIPad {
                        Spacer()
                    }
                }
                .padding()
            }
        }
        .environment(
            \.colorScheme,
             lightMode ? .light : .dark
        )
    }
}

#Preview {
    MainCalculatorView()
}
