//
//  HomeView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ChoreChartModel
    
    var body: some View {
        
        VStack {
            Text("Chore Chart")
                .font(.largeTitle)
                .bold()
            
            TitleNavigationView()
        }
        .background(Color.cyan)
    }
}

#Preview {
    HomeView()
        .environmentObject(ChoreChartModel())
}
