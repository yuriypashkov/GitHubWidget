//
//  ContributionsViewModel.swift
//  GutHubWidget
//
//  Created by Yuriy Pashkov on 15.05.2024.
//

import Foundation

class ContributionsViewModel: ObservableObject {
    @Published var days: [DevelopmentDay] = []
    @Published var selectedDay: DevelopmentDay?
    
    init() {
        DispatchQueue.global().async { [weak self] in
            self?.parse()
        }
    }
    
    private func parse() {
        GitHubParser.getDevelopmentDays(username: "yuriypashkov") { [weak self] days in
            self?.days = days
        }
    }
}
