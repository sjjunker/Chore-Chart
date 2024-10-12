//
//  TitleNavigationView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/12/24.
//
import SwiftUI

struct TitleNavigationView: View {
    
    var body: some View {
        
        VStack {
            NavigationStack {
                Spacer()
                
                NavigationLink("View Children", destination: ChildNavigationView())
                    .padding()
                    .frame(maxWidth: 300)
                    .foregroundStyle(Color.black)
                    .background(Color.teal)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                
                Spacer()
                
                NavigationLink("View Events", destination: EventView())
                    .padding()
                    .frame(maxWidth: 300)
                    .foregroundStyle(Color.black)
                    .background(Color.mint)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                
                Spacer()
            }
        }
    }
}
