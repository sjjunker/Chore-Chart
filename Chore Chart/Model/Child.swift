//
//  Child.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//
import FirebaseFirestore

class Child: Codable {
    @DocumentID var id: String?
    var name: String?
    var points: Int?
    var events: [Event?]
    
    init(id: String? = nil, name: String? = nil, points: Int? = nil, events: [Event?]) {
        self.id = id
        self.name = name
        self.points = points
        self.events = events
    }
}
