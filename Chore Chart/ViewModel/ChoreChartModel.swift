//
//  ChoreChartModel.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//
import Foundation
import FirebaseCore
import FirebaseFirestore



class ChoreChartModel: ObservableObject {
    
    //FirebaseApp.configure() this isn't working for some reason
    let db = Firestore.firestore()
    
    @Published var children: [Child] = []
    @Published var events: [Event] = []
    
    
}
