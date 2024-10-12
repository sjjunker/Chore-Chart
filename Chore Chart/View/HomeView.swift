//
//  HomeView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//
//TODO: Figure out why children events aren't reading

import SwiftUI
import Foundation

struct HomeView: View {
    @EnvironmentObject var model: ChoreChartModel
    @State var childName = ""
    @State var childPoints = ""
    @State var eventName = ""
    @State var eventPoints = ""
    @State var eventType = ""
    
    var body: some View {
        
        VStack {
            Text("Chore Chart")
            
            NavigationStack {
                Text("Children")
                
                ForEach(model.children) {child in
                    
                    HStack {
                        NavigationLink(child.name ?? "", destination: ChildView(child: child))
                        
                        Spacer()
                        
                        Button {
                            Task {
                                await model.deleteChild(child: child)
                            }
                        } label: {
                            Image(systemName: "delete.left")
                        }
                        .foregroundStyle(Color.red)
                    }
                    .padding()
                }
                
                Spacer()
                Divider()
                
                //Add child/event
                HStack {
                    VStack {
                        TextField("Child Name:", text: $childName)
                        TextField("Points", text: $childPoints)
                        
                        Button {
                            if (childName != "" && childPoints != "") {
                                Task {
                                    await model.addChild(child: Child(name: childName, points: Int(childPoints)))
                                    
                                    childName = ""
                                    childPoints = ""
                                }
                            }
                        } label: {
                            Text("Add Child")
                        }
                    }
                    
                    VStack {
                        Picker(selection: $eventType) {
                            Text("Reward").tag("reward")
                            Text("Chore").tag("chore")
                        } label: {
                            Text("Event Type")
                            Text("Choose Event Type")
                        }
                        
                        TextField("Event Name:", text: $eventName)
                        TextField("Points", text: $eventPoints)
                        
                        Button {
                            if (eventType != "" && eventName != "" && eventPoints != "") {
                                Task {
                                    await model.addEvent(event: Event(eventType: eventType, eventName: eventName, eventPoints: Int(eventPoints)))
                                    
                                    eventName = ""
                                    eventPoints = ""
                                    eventType = ""
                                }
                            }
                        } label: {
                            Text("Add Event")
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ChoreChartModel())
}
