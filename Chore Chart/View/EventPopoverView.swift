//
//  EventPopoverView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/12/24.
//
import SwiftUI

struct EventPopoverView: View {
    @EnvironmentObject var model: ChoreChartModel
    @State var event: Event
    @State private var eventPopoverShowing = false
    
    var body: some View {
        Button {
            eventPopoverShowing = true
        } label: {
            Image(systemName: "pencil.circle")
        }
        .padding()
        .popover(isPresented: $eventPopoverShowing) {
            EventEditView(event: event)
        }
    }
}
