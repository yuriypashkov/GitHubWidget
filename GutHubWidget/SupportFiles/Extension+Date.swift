//
//  Extension+Date.swift
//  GutHubWidget
//
//  Created by Yuriy Pashkov on 15.05.2024.
//

import Foundation

extension Date {
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Calendar.current.locale
        return formatter.string(from: self)
    }
}
