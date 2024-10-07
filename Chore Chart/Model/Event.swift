//
//  Event.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//

import Foundation
import FirebaseFirestore

class Event: Codable {
    @DocumentID var id: String?
    var eventDate: Date?
    var eventType: String?
    var eventName: String?
    var eventPoints: Int?
    
    init(id: String? = nil, eventDate: Date? = nil, eventType: String? = nil, eventName: String? = nil, eventPoints: Int? = nil) {
        self.id = id
        self.eventDate = eventDate
        self.eventType = eventType
        self.eventName = eventName
        self.eventPoints = eventPoints
    }
}
