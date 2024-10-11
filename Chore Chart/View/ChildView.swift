//
//  ChildView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//
import SwiftUI

struct ChildView: View {
    @EnvironmentObject var model: ChoreChartModel
    @State var child: Child
    let dateFormatter = DateFormatter()
    @State var chosenEvent: Int = 0
    
    var body: some View {
        VStack {
            //Show name and points
            HStack {
                Text(child.name ?? "")
                Spacer()
                Text("Points: " + String(child.points ?? 0))
            }
            .padding()
            
            Divider()
            
            //Show completed events
            List (child.events, id: \.id.self) {event in
                HStack {
                    Text(dateFormatter.string(from: event.eventDate ?? Date.now))
                    Spacer()
                    Text(event.eventName ?? "")
                    Spacer()
                    Text(String(event.eventPoints ?? 0))
                }
            }
            
            //Add completed events to child
            Menu {
                ForEach (model.events) {event in
                    Button {
                        Task {
                            await model.addChildEvent(child: child, event: event)
                            model.modifyChild(child: child)
                            child.calculatePoints(events: child.events, child: child)
                            model.modifyChild(child: child)
                        }
                    } label: {
                        Text(event.eventName ?? "")
                    }
                }
            } label: {
                Label("Add Child Event", systemImage: "plus")
            }
        }
    }
}
