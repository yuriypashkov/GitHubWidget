//
//  Extension+Color.swift
//  GutHubWidget
//
//  Created by Yuriy Pashkov on 15.05.2024.
//

import Foundation
import SwiftUI

extension Color {
    static func getGutHubColor(level: Int) -> Color {
        if level == 4 {
            return Color(hex: 0x216e38)
         } else if level == 3 {
             return Color(hex: 0x31a14e)
         } else if level == 2 {
             return Color(hex: 0x41c464)
         } else if level == 1 {
             return Color(hex: 0x9ae9a9)
         } else {
             return Color(hex: 0xebecf1)
         }
    }
    
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
