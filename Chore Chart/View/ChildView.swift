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
    private let dateFormatter = DateFormatter()
    
    var body: some View {
        
        VStack {
            //Show name and points
            HStack {
                //Name
                Text(child.name ?? "")
                    .font(.title)
                    .padding(.top)
                    .italic()
                
                //Edit child name
                Button {
                    model.popoverShowing = true
                } label: {
                    Image(systemName: "pencil.circle")
                }
                .popover(isPresented: $model.popoverShowing) {
                    ChildEditView(child: child)
                }
                Spacer()
                
                //Points
                Text("Points: " + String(child.points ?? 0))
                    .font(.title)
                    .padding(.top)
                    .bold()
            }
            .padding()
            
            Divider()
            Spacer()
            
            //Show completed events
            ScrollView {
                ForEach (child.events.indices, id: \.self) {index in
                    Text((child.events[index].eventDate ?? Date.now).formatted(date: .abbreviated, time: .omitted))
                        .font(.caption)
                    
                    HStack {
                        //Delete child event button
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
                        .padding()
                        .foregroundStyle(Color.red)
                        
                        //Name and points
                        Spacer()
                        Text(child.events[index].eventName ?? "")
                            .padding()
                        
                        Spacer()
                        if (child.events[index].eventType == "reward") {
                            Text("-" + String(child.events[index].eventPoints ?? 0))
                                .padding()
                        } else {
                            Text(String(child.events[index].eventPoints ?? 0))
                                .padding()
                        }
                    }
                    .background(model.setColor(index: index))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    .foregroundStyle(Color.black)
                    .padding(.horizontal, 10)
                }
            }
            .padding()
            
            
            Spacer()
            
            //Add completed events to child
            Menu {
                ForEach (model.events) {event in
                    Button {
                        //Process data
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
            .bold()
            .padding(.all, 5)
            .background(Color.yellow)
            .foregroundStyle(Color.black)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
        }
    }
}
