//
//  GitHubParser.swift
//  GutHubWidget
//
//  Created by Yuriy Pashkov on 15.05.2024.
//

import Foundation
import SwiftSoup

class GitHubParser {
    
    static func getDevelopmentDays(username: String, completion: @escaping ([DevelopmentDay] ) -> Void) {
        do {
            let url = URL(string: "https://github.com/users/\(username)/contributions")! // using this url, bcs main GitHub-page don't get contribution days in response
            let html = try String(contentsOf: url)
            
            let doc = try SwiftSoup.parse(html)
            
            // get elements from html
            let elements = try doc.getElementsByClass("ContributionCalendar-day")
            
            // parse elements
            let developmentDays = elements.compactMap { element -> DevelopmentDay? in
                guard let dateString = try? element.attr("data-date"),
                      let date = dateString.toDate(string: dateString),
                      let dataLevelString = try? element.attr("data-level"),
                      let dataLevel = Int(dataLevelString) else {
                    return nil
                }
                
                return DevelopmentDay(date: date, dataLevel: dataLevel)
            }
            
            // get last 13 weeks
            if let currentSaturday = Calendar.current.nextDate(after: Date(), matching: DateComponents(weekday: 7), matchingPolicy: .nextTime),
               let ago13Weeks = Calendar.current.date(byAdding: .weekOfMonth, value: -13, to: currentSaturday) {
                let _developmentDays = developmentDays.filter {
                    $0.date > ago13Weeks
                }
                completion(_developmentDays.sorted {$0.date < $1.date})
            } else {
                completion(developmentDays)
            }
        } catch {
            print(error)
        }
    }

}

