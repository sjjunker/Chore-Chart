//
//  ContentView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ChildView()
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
