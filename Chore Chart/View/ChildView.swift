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
            Spacer()
            
            //Show completed events
            ScrollView {
                ForEach (child.events.indices, id: \.self) {index in
                    Text((child.events[index].eventDate ?? Date.now).formatted(date: .abbreviated, time: .omitted))
                    
                    HStack {
                        //Delete button
                        Button {
                            Task {
                                await model.deleteChildEvent(child: child, childEvent: child.events[index])
                                await model.modifyChild(child: child)
                                child.calculatePoints(events: child.events, child: child)
                                await model.modifyChild(child: child)
                            }
                        } label: {
                            Image(systemName: "x.circle")
                        }
                        .foregroundStyle(Color.red)
                        
                        //Name and points
                        Spacer()
                        Text(child.events[index].eventName ?? "")
                        Spacer()
                        if (child.events[index].eventType == "reward") {
                            Text("-" + String(child.events[index].eventPoints ?? 0))
                        } else {
                            Text(String(child.events[index].eventPoints ?? 0))
                        }
                    }
                    .padding()
                    .border(Color.black, width: 1)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
                }
            }
            .padding()
            
            
            Spacer()
            
            //Add completed events to child
            Menu {
                ForEach (model.events) {event in
                    Button {
                        Task {
                            await model.addChildEvent(child: child, event: event)
                            await model.modifyChild(child: child)
                            child.calculatePoints(events: child.events, child: child)
                            await model.modifyChild(child: child)
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
