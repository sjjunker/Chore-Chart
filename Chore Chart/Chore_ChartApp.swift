//
//  Chore_ChartApp.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//

import SwiftUI

@main
struct Chore_ChartApp: App {
    @StateObject private var model = ChoreChartModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
