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
             return Color(red: 0.866, green: 0.526, blue: 1)
         } else if level == 3 {
             return Color(red: 0.650, green: 0.311, blue: 0.766)
         } else if level == 2 {
             return Color(red: 0.497, green: 0.156, blue: 0.61)
         } else if level == 1 {
             return Color(red: 0.346, green: 0, blue: 0.434)
         } else {
             return Color.clear
         }
    }
}
