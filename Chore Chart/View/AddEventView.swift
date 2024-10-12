//
//  AddEventView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/12/24.
//
import SwiftUI
import Foundation

struct AddEventView: View {
    @EnvironmentObject var model: ChoreChartModel
    @State private var eventName = ""
    @State private var eventPoints = ""
    @State private var eventType = "chore"
    
    var body: some View {

        VStack (alignment: .trailing) {
            
            //Event type
            Picker("Event Type", selection: $eventType) {
                Text("Reward").tag("reward")
                Text("Chore").tag("chore")
            }
            .padding(.all, 2)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
            
            //Event name
            TextField("Event Name:", text: $eventName)
                .padding(.all, 2)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
            
            //Event points
            TextField("Points", text: $eventPoints)
                .padding(.all, 2)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
            
            //Add event
            Button ("Add Event") {
                if (eventType != "" && eventName != "" && eventPoints != "") {
                    Task {
                        await model.addEvent(event: Event(eventType: eventType, eventName: eventName, eventPoints: Int(eventPoints)))
                        
                        eventName = ""
                        eventPoints = ""
                        eventType = ""
                    }
                }
            }
            .bold()
            .foregroundStyle(Color.black)
            .padding(.all, 5)
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
        }
        .frame(maxWidth: .infinity, maxHeight: 125, alignment: .bottomLeading)
        .padding()
    }
}
