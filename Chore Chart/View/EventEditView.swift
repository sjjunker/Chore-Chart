//
//  EventEditView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/12/24.
//
import SwiftUI
import Foundation

struct EventEditView: View {
    @EnvironmentObject var model: ChoreChartModel
    @State var event: Event
    @State private var eventName: String = ""
    @State private var eventType: String = ""
    @State private var eventPoints: String = ""
    
    var body: some View {
        VStack {
            Text("Edit Event")
                .padding()
                .font(.title)
            
            //Edit name
            TextField("Name", text: $eventName)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                .font(.body)
            
            //Edit type
            TextField("Type", text: $eventType)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                .font(.body)
                .textInputAutocapitalization(.never)
            
            //Edit Points
            TextField("Points", text: $eventPoints)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                .font(.body)
            
            Button ("Submit") {
                
                //Set any changes
                if (eventName != "") {event.eventName = eventName}
                if (eventType != "") {event.eventType = eventType}
                if (eventPoints != "") {event.eventPoints = Int(eventPoints)}
                
                //Modify database
                Task {
                    await model.modifyEvent(event: event)
                }
            }
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
        }
        .padding()
        .background(Color.cyan)
        .foregroundStyle(Color.black)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
    }
}
