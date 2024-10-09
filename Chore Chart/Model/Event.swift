//
//  Event.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//

import Foundation
import FirebaseFirestore

class Event: Codable, Identifiable {
    @DocumentID var id: String?
    var eventType: String?
    var eventName: String?
    var eventPoints: Int?
    
    init(id: String? = nil, eventType: String? = nil, eventName: String? = nil, eventPoints: Int? = nil) {
        self.id = id
        self.eventType = eventType
        self.eventName = eventName
        self.eventPoints = eventPoints
    }
}
