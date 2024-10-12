//
//  EventScrollView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/12/24.
//
import SwiftUI

struct EventScrollView: View {
    @EnvironmentObject var model: ChoreChartModel
    var eventType: String = ""
    
    var body: some View {
        ScrollView {
            ForEach(model.events.indices, id: \.self) {index in
                if (model.events[index].eventType == eventType) {
                    HStack {
                        
                        //Edit the event
                        EventPopoverView(event: model.events[index])
                        
                        //Event name and points
                        Text(model.events[index].eventName ?? "")
                            .padding()
                        Text(String(model.events[index].eventPoints!))
                            .padding()
                        Spacer()
                        
                        //Delete event
                        Button {
                            Task {
                                await model.deleteEvent(event: model.events[index])
                            }
                        } label: {
                            Image(systemName: "x.circle")
                                .foregroundStyle(Color.red)
                                .bold()
                        }
                        .padding()
                    }
                    .background(model.setColor(index: index))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    .foregroundStyle(Color.black)
                    .padding(.horizontal, 10)
                }
            }
        }
        .padding()
    }
}
