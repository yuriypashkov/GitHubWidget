//
//  ContributionsGraphView.swift
//  GutHubWidget
//
//  Created by Yuriy Pashkov on 15.05.2024.
//

import SwiftUI

struct ContributionsGraphView: View {
    
    static let boxSize: CGFloat = 15
    static let spacing: CGFloat = 4
    
    private let rows = Array(repeating: GridItem(.fixed(boxSize), spacing: spacing), count: 7)
    
    let days: [DevelopmentDay]
    let selectedDay: (DevelopmentDay) -> Void
    
    var body: some View {
        LazyHGrid(rows: rows, spacing: Self.spacing) {
            ForEach(days, id:\.date) { day in
                Color.getGutHubColor(level: day.dataLevel)
                    .frame(width: Self.boxSize, height: Self.boxSize, alignment: .center)
                    .clipShape(.rect(cornerRadius: 3))
                    .onTapGesture {
                        selectedDay(day)
                    }
            }
        }
    }
}

//#Preview {
//    ContributionsGraphView()
//}
