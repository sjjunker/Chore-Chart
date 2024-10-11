//
//  Child.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//
import FirebaseFirestore

class Child: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String?
    var points: Int?
    var events: [ChildEvent] = []
    
    init(id: String? = nil, name: String? = nil, points: Int? = nil) {
        self.id = id
        self.name = name
        if self.events.count > 0 {
            calculatePoints(events: self.events, child: self)
        } else {
            self.points = 0
        }
    }
    
    func calculatePoints(events: [ChildEvent], child: Child) {
        var points = 0
        
        for event in events {
            points += event.eventPoints!
        }
        
        child.points = points
        
    }
}
