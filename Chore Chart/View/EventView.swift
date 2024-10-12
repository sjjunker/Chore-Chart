//
//  EventView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/12/24.
//
import SwiftUI

struct EventView: View {
    @EnvironmentObject var model: ChoreChartModel
    
    var body: some View {
        VStack {
            //Title
            Text("Events")
                .font(.title)
                .padding(.top)
                .italic()
            
            //Chores list
            Text("Chores")
                .font(.title2)
                .padding()
            EventScrollView(eventType: "chore")
            
            Divider()
            
            //Rewards List
            Text("Rewards")
                .font(.title2)
                .padding()
            EventScrollView(eventType: "reward")
            
            AddEventView()
        }
    }
}
