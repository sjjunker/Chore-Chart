//
//  ChildEvent.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/9/24.
//
import Foundation
import FirebaseFirestore

class ChildEvent: Codable, Identifiable {
    var id: UUID?
    var eventType: String?
    var eventName: String?
    var eventPoints: Int?
    var eventDate: Date?
    
    init(id: UUID? = nil, eventType:String?, eventName: String? = nil, eventPoints: Int? = nil, eventDate: Date? = nil) {
        self.id = id
        self.eventType = eventType
        self.eventName = eventName
        self.eventPoints = eventPoints
        self.eventDate = eventDate
    }
}
