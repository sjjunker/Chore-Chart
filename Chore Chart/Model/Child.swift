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
        self.points = points
    }
}
