//
//  Event.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//

import Foundation

class Event: Codable {
    var eventDate: Date?
    var eventType: String?
    var eventName: String?
    var eventPoints: Int?
    
    init(eventDate: Date? = nil, eventType: String? = nil, eventName: String? = nil, eventPoints: Int? = nil) {
        self.eventDate = eventDate
        self.eventType = eventType
        self.eventName = eventName
        self.eventPoints = eventPoints
    }
}
