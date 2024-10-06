//
//  Child.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//
class Child: Codable {
    var name: String?
    var points: Int?
    var events: [Event?]
    
    init(name: String? = nil, points: Int? = nil, events: [Event?]) {
        self.name = name
        self.points = points
        self.events = events
    }
}
