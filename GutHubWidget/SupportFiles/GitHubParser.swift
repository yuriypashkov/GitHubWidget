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
            let url = URL(string: "https://github.com/users/\(username)/contributions")!
            let html = try String(contentsOf: url)
            
            let doc = try SwiftSoup.parse(html)
            let elements = try doc.getElementsByClass("ContributionCalendar-day")
            elements.forEach { element in
                print(element)
            }
            
            
        } catch {
            print(error)
        }
    }

}

