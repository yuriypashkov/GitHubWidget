//
//  DevelopmentDay.swift
//  GutHubWidget
//
//  Created by Yuriy Pashkov on 15.05.2024.
//

import Foundation

struct DevelopmentDay: Identifiable {
    var id = UUID().uuidString
    
    let date: Date
    let dataLevel: Int
}
