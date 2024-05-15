//
//  ContentView.swift
//  GutHubWidget
//
//  Created by Yuriy Pashkov on 15.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContributionsViewModel()
    
    var body: some View {
        VStack {
            ContributionsGraphView(days: viewModel.days) { day in
                viewModel.selectedDay = day
            }
            
            if let selectedDay = viewModel.selectedDay {
                Text("You have \(selectedDay.dataLevel) data level on \(selectedDay.date.toString())")
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
