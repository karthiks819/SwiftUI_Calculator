//
//  iPad Support.swift
//  Calc_swiftUI
//
//  Created by Karthik Solleti on 16/12/25.
//

import UIKit

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
