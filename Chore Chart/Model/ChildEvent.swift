//
//  ChildEvent.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/9/24.
//
import Foundation
import FirebaseFirestore

class ChildEvent: Event {
    var eventDate: Date?
    
    init(id: String? = nil, eventType: String? = nil, eventName: String? = nil, eventPoints: Int? = nil, eventDate: Date? = nil) {
        
        self.eventDate = eventDate
        super.init(id: id, eventType: eventType, eventName: eventName, eventPoints: eventPoints)
        
    }
    
    required init(from decoder: any Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
