//
//  ContributionsGraphView.swift
//  GutHubWidget
//
//  Created by Yuriy Pashkov on 15.05.2024.
//

import SwiftUI

struct ContributionsGraphView: View {
    
    private static let boxSize: CGFloat = 16
    private static let spacing: CGFloat = 4
    
    private let rows = Array(repeating: GridItem(.fixed(boxSize), spacing: spacing), count: 7)
    
    let days: [DevelopmentDay]
    let selectedDay: (DevelopmentDay) -> Void
    
    var body: some View {
        HStack {
            VStack(spacing: 3) {
                let weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                ForEach(weekDays, id:\.self) { day in
                    Text(day)
                        .font(.system(size: 14))
                }
            }
            LazyHGrid(rows: rows, spacing: Self.spacing) {
                ForEach(days) { day in
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: Self.boxSize, height: Self.boxSize)
                        .foregroundStyle(Color.getGutHubColor(level: day.dataLevel))
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(.gray).opacity(0.2), lineWidth: day.dataLevel == 0 ? 1 : 0)
                        }
                        .onTapGesture {
                            selectedDay(day)
                        }
                    
                }
            }
        }
    }
}
