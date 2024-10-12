//
//  ChildEvent.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/9/24.
//
import FirebaseFirestore

class ChildEvent: Codable, Identifiable {
    @DocumentID var id: String?
    var eventType: String?
    var eventName: String?
    var eventPoints: Int?
    var eventDate: Date?
    
    init(id: UUID? = nil, eventType:String?, eventName: String? = nil, eventPoints: Int? = nil, eventDate: Date? = nil) {
        self.eventType = eventType
        self.eventName = eventName
        self.eventPoints = eventPoints
        self.eventDate = eventDate
    }
}
