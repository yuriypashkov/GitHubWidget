//
//  GitHub_Widget.swift
//  GitHub Widget
//
//  Created by Yuriy Pashkov on 16.05.2024.
//

import WidgetKit
import SwiftUI

struct ContributionDaysGraphEntry: TimelineEntry {
    var date: Date
    let days: [DevelopmentDay]
}

struct Provider: TimelineProvider {
    
    private var entry: ContributionDaysGraphEntry {
        let now = Date()
        let days = (0..<91).map { index -> DevelopmentDay in // last 13 weeks
            let date = Calendar.current.date(byAdding: .day, value: -index, to: now)!
            return DevelopmentDay(date: date, dataLevel: 0)
        }
        return ContributionDaysGraphEntry(date: now, days: days)
    }
    
    func placeholder(in context: Context) -> ContributionDaysGraphEntry {
        entry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        GitHubParser.getDevelopmentDays(username: "yuriypashkov") { days in
            let entry = ContributionDaysGraphEntry(date: Date(), days: days)
            let timeline = Timeline(entries: [entry],
                                    policy: TimelineReloadPolicy.after(Calendar.current.date(byAdding: .day, value: 1, to: Date())!) // update widget every day
            )
            completion(timeline)
        }
    }
}

struct WidgetEntryView: View {
    let entry: Provider.Entry
    
    var body: some View {
        ContributionsGraphView(days: entry.days, selectedDay: { _ in })
    }
}

struct ContributionDaysGraphWidget: Widget {
    
    private let kind = "GitHub_Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
    }
}
