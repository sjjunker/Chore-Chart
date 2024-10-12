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
    
    var body: some View {
        
        VStack {
            Text("Chore Chart")
                .font(.largeTitle)
                .bold()
            
            NavigationView()
            
            Spacer()
            
            HStack {
                AddChildView()
                AddEventView()
            }
        }
        .background(Color.cyan)
    }
}

#Preview {
    HomeView()
        .environmentObject(ChoreChartModel())
}
