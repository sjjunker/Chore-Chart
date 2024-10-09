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
            HStack {
                Text(child.name ?? "")
                Spacer()
                Text("Points:" + String(child.points ?? 0))
            }
            
            Divider()
            
            List(child.events) {event in
                HStack {
                    Text(dateFormatter.string(from: event.eventDate ?? Date.now))
                    Spacer()
                    Text(event.eventName!)
                    Spacer()
                    Text(String(event.eventPoints ?? 0))
                }
            }
            
            Button {
                Picker("Event", selection: $chosenEvent) {
                    ForEach(model.events, id: \.id) { event in
                        Text(event.eventName ?? "").tag(event.eventName ?? "")
                    }
                }
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}
