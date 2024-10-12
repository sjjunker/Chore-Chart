//
//  AddChildView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/12/24.
//
import SwiftUI
import Foundation

struct AddChildView: View {
    @EnvironmentObject var model: ChoreChartModel
    @State var childName = ""
    @State var childPoints = ""
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            //Child name
            TextField("Child Name:", text: $childName)
                .padding(.all, 2)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
            
            //Child points
            TextField("Points", text: $childPoints)
                .padding(.all, 2)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
            
            //Add child
            Button ("Add Child") {
                if (childName != "" && childPoints != "") {
                    Task {
                        await model.addChild(child: Child(name: childName, points: Int(childPoints)))
                        
                        childName = ""
                        childPoints = ""
                    }
                }
            }
            .bold()
            .foregroundStyle(Color.black)
            .padding(.all, 5)
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
        }
        .frame(maxWidth: .infinity, maxHeight: 125, alignment: .bottomLeading)
        .padding()
    }
}
