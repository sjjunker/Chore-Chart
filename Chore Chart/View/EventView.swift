//
//  EventView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/12/24.
//
import SwiftUI
import Foundation

struct EventView: View {
    @EnvironmentObject var model: ChoreChartModel
    
    var body: some View {
        VStack {
            //Title
            Text("Events")
                .font(.title)
                .padding(.top)
                .italic()
            
            //Child list
            //TODO: split rewards from events in two different scrollviews within a tabview
            //TODO: create new view from this scrollview, and bring in an eventype parameter to change the view based on if it is a chore or reward
            ScrollView {
                ForEach(model.events.indices, id: \.self) {index in
                    
                    HStack {

                        //TODO: add editing capabilities
                        
                        Text(model.events[index].eventName ?? "")
                        Text(model.events[index].eventType ?? "")
                        Text(String(model.events[index].eventPoints!))
                        Spacer()
                        
                        //Delete child
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
            .padding()
            
            AddEventView()
        }
    }
}
